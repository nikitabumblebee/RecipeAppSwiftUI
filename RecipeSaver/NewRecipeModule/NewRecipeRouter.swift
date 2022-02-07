//
//  NewRecipeRouter.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 07.02.2022.
//

import Foundation
import SwiftUI

class NewRecipeRouter {
  func makeNewRecipe(model: DataModel) -> some View {
    let recipe = Recipe(name: "", image: "", description: "", ingredients: "", directions: "", category: Category.main.rawValue, datePublished: "", url: "", isUserRecipe: true)
    let interactor = AddRecipeInteractor(model: model)
    let presenter = AddRecipePresenter(interactor: interactor, recipe: recipe, isEdit: false, recipeImage: UIImage(systemName: "photo")!)
    let bindableRecipe = Binding(get: { return recipe }, set: { _,_ in  })
    let bindableIsEdit = Binding(get: { return false }, set: { _,_ in })
    return AddRecipeView(presenter: presenter, recipe: bindableRecipe, isEdit: bindableIsEdit)
  }
}
