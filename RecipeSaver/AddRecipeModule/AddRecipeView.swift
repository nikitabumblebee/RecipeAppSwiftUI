//
//  AddRecipeView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 29.01.2022.
//

import SwiftUI

struct AddRecipeView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var presenter: AddRecipePresenter
    
    @Binding var recipe: Recipe
    @Binding var isEdit: Bool
    
    @State private var recipeImage = UIImage(systemName: "photo")!
    @State private var showingImagePicker = false
    
    var body: some View {
        ZStack {
            VStack {
                NavigationHeaderView()
                VStack {
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
                    .navigationTitle(isEdit ? recipe.name : "New Recipe")
                    .navigationBarTitleDisplayMode(.inline)
                    .onAppear {
                        if isEdit {
                            recipeImage = presenter.loadRecipeImage()
                        }
                    }
                    .sheet(isPresented: $showingImagePicker) {
                        PhotoPicker(image: self.$recipeImage)
                    }
                }
                .navigationViewStyle(.stack)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(
                    leading: Button(action: { self.presentationMode.wrappedValue.dismiss() }) { Text("Cancel") },
                    trailing: Button(action: {
                        if isEdit {
                            self.presenter.updateRecipe(recipeImage: recipeImage)
                        } else {
                            self.presenter.saveRecipe(recipeImage: recipeImage)
                        }
                        self.presentationMode.wrappedValue.dismiss() }) { Text("Save") }
                        .disabled(isEdit ? false : recipe.name.isEmpty)
                )
            }
        }
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        @State var recipe = DataModel.sample.recipes[0]
        @State var isEdit = false
        @State var recipeImage = UIImage(systemName: "photo")!
        
        let interactor = AddRecipeInteractor(model: DataModel.sample)
        let presenter = AddRecipePresenter(interactor: interactor, recipe: recipe, recipeImage: recipeImage)
        
        return AddRecipeView(presenter: presenter, recipe: $recipe, isEdit: $isEdit)
    }
}
