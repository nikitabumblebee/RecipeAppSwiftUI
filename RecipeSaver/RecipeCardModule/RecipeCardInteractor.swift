//
//  RecipeCardInteractor.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 05.02.2022.
//

import Foundation

class RecipeCardInteractor {
  let recipe: Recipe
  let model: DataModel
  
  init(model: DataModel, recipe: Recipe) {
    self.model = model
    self.recipe = recipe
  }
  
  func addRecipeToFavorite() {
    recipe.isFavorite = true
    model.updateRecipe(recipe: recipe)
  }
  
  func removeRecipeFromFavorite() {
    recipe.isFavorite = false
    model.updateRecipe(recipe: recipe)
  }
}
