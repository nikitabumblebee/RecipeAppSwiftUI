//
//  AddRecipeView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 29.01.2022.
//

import SwiftUI

struct AddRecipeView: View {
  @EnvironmentObject var recipesVM: RecipesViewModel

  @State private var name: String = ""
  @State private var selectedCategory: Category = Category.main
  @State private var description: String = ""
  @State private var ingredients: String = ""
  @State private var directions: String = ""
  @State private var navigateToRecipe = false
  @State private var recipeImage = UIImage(systemName: "photo")!
  @State private var showingImagePicker = false
  
  @Environment(\.dismiss) var dismiss
  
  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Image")) {
          HStack {
            Image(uiImage: recipeImage)
              .resizable()
              .aspectRatio(contentMode: recipeImage == UIImage(systemName: "photo") ? .fit : .fill)
              .frame(height: 100)
            Spacer()
            Button(action: { showingImagePicker = true }) { Text("Select Image") }
          }
        }
        
        Section(header: Text("Name")) {
          TextField("Recipe Name", text: $name)
        }
        Section(header: Text("Category")) {
          Picker("Category", selection: $selectedCategory) {
            ForEach(Category.allCases) { category in
              Text(category.rawValue)
                .tag(category)
            }
          }
          .pickerStyle(.menu)
        }
        Section(header: Text("Description")) {
          TextEditor(text: $description)
        }
        Section(header: Text("Ingredients")) {
          TextEditor(text: $ingredients)
        }
        Section(header: Text("Directions")) {
          TextEditor(text: $directions)
        }
      }
      .toolbar(content: {
        ToolbarItem(placement: .navigationBarLeading) {
          Button {
            dismiss()
          } label: {
            Label("Cancel", systemImage: "xmark")
              .labelStyle(.iconOnly)
          }
        }
        ToolbarItem {
          NavigationLink(isActive: $navigateToRecipe) {
            RecipeView(recipe: recipesVM.recipes.sorted { $0.datePublished > $1.datePublished }[0])
              .navigationBarBackButtonHidden(true)
          } label: {
            Button {
              saveRecipe()
              navigateToRecipe = true
            } label: {
              Label("Done", systemImage: "checkmark")
                .labelStyle(.iconOnly)
            }
          }
          .disabled(name.isEmpty)
        }
      })
      .navigationTitle("New Recipe")
      .navigationBarTitleDisplayMode(.inline)
      .sheet(isPresented: $showingImagePicker) {
        PhotoPicker(image: self.$recipeImage)
      }
    }
    .navigationViewStyle(.stack)
  }
}

struct AddRecipeView_Previews: PreviewProvider {
  static var previews: some View {
    AddRecipeView()
  }
}

extension AddRecipeView {
  private func saveRecipe() {
    let now = Date()
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-mm-dd"
    
    let datePublished = dateFormatter.string(from: now)
    
    let imageLoader = ImageLoader()
    imageLoader.saveImage(imageName: name, image: recipeImage)
    
    let recipe = Recipe(name: name, image: name, description: description, ingredients: ingredients, directions: description, category: selectedCategory.rawValue, datePublished: datePublished, url: "")
    
    recipesVM.addRecipe(recipe: recipe)
  }
}
