//
//  FavoritesViewModel.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 30.01.2022.
//

import Foundation

class FavoritesViewModel: ObservableObject {
  
  @Published private(set) var recipes: [Recipe]
  
  init(recipes: [Recipe]) {
    self.recipes = recipes
  }
  
  func fetchData() {
    recipes = Recipe.all.filter { $0.isFavorite }
  }
}
