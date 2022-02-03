//
//  AddRecipeView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 29.01.2022.
//

import SwiftUI

struct AddRecipeView: View {
  @EnvironmentObject var recipesVM: RecipesViewModel
  
  @Binding var recipe: Recipe
  @Binding var isEdit: Bool
  
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
          TextField(recipe.name, text: $recipe.name)
        }
        Section(header: Text("Category")) {
          Picker("Category", selection: $recipe.category) {
            ForEach(Category.allCases) { category in
              Text(category.rawValue)
                .tag(category)
            }
          }
          .pickerStyle(.menu)
        }
        Section(header: Text("Description")) {
          TextEditor(text: $recipe.description)
        }
        Section(header: Text("Ingredients")) {
          TextEditor(text: $recipe.ingredients)
        }
        Section(header: Text("Directions")) {
          TextEditor(text: $recipe.directions)
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
          .disabled(isEdit ? false : recipe.name.isEmpty)
        }
      })
      .navigationTitle(isEdit ? recipe.name : "New Recipe")
      .navigationBarTitleDisplayMode(.inline)
      .onAppear {
        loadStateVariables()
      }
      .sheet(isPresented: $showingImagePicker) {
        PhotoPicker(image: self.$recipeImage)
      }
    }
    .navigationViewStyle(.stack)
  }
}

struct AddRecipeView_Previews: PreviewProvider {
  static var previews: some View {
    @State var recipe = Recipe.all[0]
    @State var isEdit = false
    @State var recipeImage = UIImage(systemName: "photo")!
    return AddRecipeView(recipe: $recipe, isEdit: $isEdit)
  }
}

extension AddRecipeView {
  private func saveRecipe() {
    let now = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-mm-dd"
    let datePublished = dateFormatter.string(from: now)
    
    let imageLoader = ImageLoader()
    imageLoader.saveImage(imageName: recipe.name, image: recipeImage)
    if isEdit {
      if let row = Recipe.all.firstIndex(where: { $0.id == recipe.id }) {
        var existedRecipe = Recipe.all[row]
        existedRecipe.name = recipe.name
        existedRecipe.image = recipe.name
        existedRecipe.description = recipe.description
        existedRecipe.ingredients = recipe.ingredients
        existedRecipe.directions = recipe.directions
        existedRecipe.category = recipe.category
        existedRecipe.datePublished = datePublished
        recipesVM.updateRecipe(recipe: existedRecipe)
        Recipe.all[row] = existedRecipe
      }
    }
    else {
      let newRecipe = Recipe(name: recipe.name, image: recipe.name, description: recipe.description, ingredients: recipe.ingredients, directions: recipe.directions, category: recipe.category, datePublished: datePublished, url: "", isUserRecipe: true)
      recipesVM.addRecipe(recipe: newRecipe)
      Recipe.addRecipe(recipe: newRecipe)
    }
  }
  
  func loadStateVariables() {
    let imageLoader = ImageLoader()
    if isEdit {
      recipeImage = imageLoader.loadImageFromDiskWith(fileName: recipe.name)!
    }
  }
}
