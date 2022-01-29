//
//  RecipesViewModel.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 29.01.2022.
//

import Foundation

class RecipesViewModel: ObservableObject {
  @Published private(set) var recipes: [Recipe] = []
  
  init() {
    recipes = Recipe.all
  }
  
  func addRecipe(recipe: Recipe) {
    recipes.append(recipe)
  }
}
