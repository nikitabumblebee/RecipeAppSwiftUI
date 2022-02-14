//
//  RecipeListRouter.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 04.02.2022.
//

import SwiftUI

class RecipeListRouter {
    func moveToRecipe(recipe: Recipe, model: DataModel) -> some View {
        let presenter = RecipeDescriptionPresenter(interactor: RecipeDescriptionInteractor(model: model), recipe: recipe)
        return RecipeDescriptionView(presenter: presenter)
    }
}
