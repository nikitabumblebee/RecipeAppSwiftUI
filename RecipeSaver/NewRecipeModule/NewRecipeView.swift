//
//  NewRecipeView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 21.01.2022.
//

import SwiftUI

struct NewRecipeView: View {
  @ObservedObject var presenter: NewRecipePresenter
  @EnvironmentObject var model: DataModel
  
//  @State private var showAddRecipe = false
//  @State private var recipe = Recipe(name: "", image: "", description: "", ingredients: "", directions: "", category: Category.main.rawValue, datePublished: "", url: "", isUserRecipe: true)
//  @State private var isEdit = false
//  @State private var recipeImage = UIImage(systemName: "photo")!
  
  var body: some View {
    NavigationView {
      presenter.makeNewRecipe()
      
//      let interactor = AddRecipeInteractor(model: model)
//      let presenter = AddRecipePresenter(interactor: interactor, recipe: recipe, isEdit: isEdit, recipeImage: recipeImage)
//      NavigationLink(destination: AddRecipeView(presenter: presenter, recipe: self.$recipe, isEdit: self.$isEdit)) {
//        Text("Add recipe manually")
//      }
      .navigationTitle("New Recipe")
    }
    .navigationViewStyle(.stack)
  }
}

struct NewRecipeView_Previews: PreviewProvider {
  static var previews: some View {
    NewRecipeView(presenter: NewRecipePresenter(interactor: NewRecipeInteractor(model: DataModel.sample)))
  }
}
