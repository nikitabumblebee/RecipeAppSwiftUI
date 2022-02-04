//
//  RecipeListInteractor.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 04.02.2022.
//

import Foundation
import Combine

class RecipeListInteractor {
  //private let recipes: [Recipe]
  
  @Published var recipes: [Recipe] = []
  
  init(recipes: [Recipe]) {
    self.recipes = Recipe.all
  }
}
