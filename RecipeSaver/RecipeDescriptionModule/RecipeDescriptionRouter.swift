//
//  RecipeDescriptionRouter.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 07.02.2022.
//

import SwiftUI

class RecipeDescriptionRouter {  
    func editRecipe(for recipe: Binding<Recipe>, isEdit: Binding<Bool>, model: DataModel) -> some View {
        let interactor = AddRecipeInteractor(model: model)
        let presenter = AddRecipePresenter(interactor: interactor, recipe: recipe.wrappedValue)
        return AddRecipeView(presenter: presenter, isEdit: isEdit)
    }
}
