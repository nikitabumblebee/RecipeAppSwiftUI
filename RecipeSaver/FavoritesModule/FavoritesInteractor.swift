//
//  FavoritesInteractor.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 05.02.2022.
//

import Foundation
import Combine

class FavoritesInteractor {
  let model: DataModel
  
  var favoriteRecipes: [Recipe] = []
  
  init(model: DataModel) {
    self.model = model
    favoriteRecipes = model.recipes.filter { $0.isFavorite }
  }
}
