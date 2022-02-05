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
    if let existedRecipeIndex = model.recipes.firstIndex(where: { $0.name == recipe.name }) {
      model.recipes[existedRecipeIndex].isFavorite = true
    }
  }
  
  func removeRecipeFromFavorite() {
    recipe.isFavorite = false
    if let existedRecipeIndex = model.recipes.firstIndex(where: { $0.name == recipe.name }) {
      model.recipes[existedRecipeIndex].isFavorite = false
    }
  }
}
