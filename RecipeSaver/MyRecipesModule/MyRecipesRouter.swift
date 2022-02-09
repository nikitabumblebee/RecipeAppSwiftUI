//
//  MyRecipesRouter.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 09.02.2022.
//

import SwiftUI

class MyRecipesRouter {
    func moveToRecipe(recipe: Recipe, model: DataModel) -> some View {
        let presenter = RecipeDescriptionPresenter(interactor: RecipeDescriptionInteractor(model: model))
        return RecipeView(recipe: recipe, presenter: presenter)
    }
    
    func makeNewRecipe(model: DataModel) -> some View {
        let recipe = Recipe(name: "", image: "", description: "", ingredients: "", directions: "", category: Category.main.rawValue, datePublished: "", url: "", isUserRecipe: true)
        let interactor = AddRecipeInteractor(model: model)
        let presenter = AddRecipePresenter(interactor: interactor, recipe: recipe, recipeImage: UIImage(systemName: "photo")!)
        let bindableRecipe = Binding(get: { return recipe }, set: { _,_ in  })
        let bindableIsEdit = Binding(get: { return false }, set: { _,_ in })
        return AddRecipeView(presenter: presenter, recipe: bindableRecipe, isEdit: bindableIsEdit)
    }
}
