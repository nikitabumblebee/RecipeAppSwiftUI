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
    
    @Binding var isEdit: Bool
    
    @State private var recipeImage = UIImage(systemName: "photo")!
    @State private var showingImagePicker = false
    @State private var timer = "0"
    
    var body: some View {
        VStack {
            NavigationHeaderView()
            VStack {
                Form {
                    Section(header: Text("Image")) {
                        HStack {
                            Image(uiImage: presenter.recipeImage)
                                .resizable()
                                .aspectRatio(contentMode: presenter.recipeImage == UIImage(systemName: "photo") ? .fit : .fill)
                                .frame(height: 100)
                            
                            Spacer()
                            Button(action: { showingImagePicker = true }) { Text("Select Image") }
                        }
                    }
                    Section(header: Text("Name")) {
                        TextField(presenter.recipe.name, text: $presenter.recipe.name)
                    }
                    Section(header: Text("Category")) {
                        Picker("Category", selection: $presenter.recipe.category) {
                            ForEach(Category.allCases) { category in
                                Text(category.rawValue)
                                    .tag(category)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                    Section(content: {
                        HStack {
                            Text("Minutes:")
                            TextField(presenter.recipe.cookTime, text: $presenter.recipe.cookTime)
                                .keyboardType(.decimalPad)
                        }
                    }, header: {
                        Text("Time")
                    })
                    Section(header: Text("Description")) {
                        TextEditor(text: $presenter.recipe.description)
                    }
                    Section(header: Text("Ingredients")) {
                        TextEditor(text: $presenter.recipe.ingredients)
                    }
                    Section(header: Text("Directions")) {
                        TextEditor(text: $presenter.recipe.directions)
                    }
                }
                .padding(.top, -7.5)
                .navigationTitle(isEdit ? presenter.recipe.name : "New Recipe")
                .navigationBarTitleDisplayMode(.inline)
                .onAppear {
                    if isEdit {
                        recipeImage = presenter.loadRecipeImage()
                    }
                }
                .sheet(isPresented: $showingImagePicker) {
                    PhotoPicker(image: self.$presenter.recipeImage)
                }
            }
            .navigationViewStyle(.stack)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading: Button(action: { self.presentationMode.wrappedValue.dismiss() }) { Text("Cancel") },
                trailing: Button(action: {
                    if isEdit {
                        self.presenter.updateRecipe(recipeImage: presenter.recipeImage)
                    } else {
                        self.presenter.saveRecipe(recipeImage: presenter.recipeImage)
                    }
                    self.presentationMode.wrappedValue.dismiss() }) { Text("Save") }
                    .disabled(isEdit ? false : presenter.recipe.name.isEmpty)
            )
        }
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        @State var recipe = DataModel.sample.recipes[0]
        @State var isEdit = false
        
        let interactor = AddRecipeInteractor(model: DataModel.sample)
        let presenter = AddRecipePresenter(interactor: interactor, recipe: recipe)
        
        return AddRecipeView(presenter: presenter, isEdit: $isEdit)
    }
}
