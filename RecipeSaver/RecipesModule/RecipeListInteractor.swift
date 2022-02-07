//
//  RecipeListInteractor.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 04.02.2022.
//

import Foundation
import Combine

class RecipeListInteractor {
  var model: DataModel
  
  @Published var recipes: [Recipe] = []
  
  init(recipes: [Recipe], model: DataModel) {
    self.recipes = recipes
    self.model = model
  }
}
