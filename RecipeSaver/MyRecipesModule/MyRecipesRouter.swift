//
//  MyRecipesRouter.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 09.02.2022.
//

import SwiftUI

class MyRecipesRouter {
    func moveToRecipe(recipe: Recipe, model: DataModel) -> some View {
        let presenter = RecipeDescriptionPresenter(interactor: RecipeDescriptionInteractor(model: model), recipe: recipe)
        return RecipeDescriptionView(presenter: presenter)
    }
    
    func makeNewRecipe(model: DataModel) -> some View {
        let recipe = UserRecipe(name: "", image: "", description: "", ingredients: "", directions: "", category: Category.main.rawValue, datePublished: "", url: "", cookTime: "0", recipeType: [RecipeType.user.rawValue])
        let interactor = AddRecipeInteractor(model: model)
        let presenter = AddRecipePresenter(interactor: interactor, recipe: recipe)
        let bindableIsEdit = Binding(get: { return false }, set: { _,_ in })
        return AddRecipeView(presenter: presenter, isEdit: bindableIsEdit)
    }
}
