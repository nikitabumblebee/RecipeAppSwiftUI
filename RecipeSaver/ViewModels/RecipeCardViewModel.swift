//
//  RecipeCardViewModel.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 30.01.2022.
//

import Foundation

class RecipeCardViewModel: ObservableObject {
  @Published private(set) var recipe: Recipe
  
  init(recipe: Recipe) {
    self.recipe = recipe
  }
  
  func addRecipeToFavorite() {
    recipe.isFavorite = true
    if let existedRecipeIndex = Recipe.all.firstIndex(where: { $0.name == recipe.name }) {
      Recipe.all[existedRecipeIndex].isFavorite = true
    }
  }
  
  func removeRecipeFromFavorite() {
    recipe.isFavorite = false
    if let existedRecipeIndex = Recipe.all.firstIndex(where: { $0.name == recipe.name }) {
      Recipe.all[existedRecipeIndex].isFavorite = false
    }
  }
  
  func fetchData() {    
    if let existedRecipeIndex = Recipe.all.firstIndex(where: { $0.name == recipe.name }) {
      recipe.isFavorite = Recipe.all[existedRecipeIndex].isFavorite
    }
  }
}
