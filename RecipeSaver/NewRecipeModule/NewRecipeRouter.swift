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
        let presenter = AddRecipePresenter(interactor: interactor, recipe: recipe)
        let bindableIsEdit = Binding(get: { return false }, set: { _,_ in })
        return AddRecipeView(presenter: presenter, isEdit: bindableIsEdit)
    }
}
