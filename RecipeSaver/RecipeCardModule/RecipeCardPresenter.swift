//
//  RecipeCardViewModel.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 30.01.2022.
//

import Foundation
import SwiftUI
import Combine

class RecipeCardPresenter: ObservableObject {
  @Published private(set) var recipe: Recipe
  @Published private(set) var isFavorite: Bool = false
  
  private var cancellables = Set<AnyCancellable>()
  private var interactor: RecipeCardInteractor
  
  init(interactor: RecipeCardInteractor) {
    self.interactor = interactor
    self.recipe = interactor.recipe
    
    interactor.recipe.$isFavorite
      .assign(to: \.isFavorite, on: self)
      .store(in: &cancellables)
  }
  
  func addRecipeToFavorite() {
    interactor.addRecipeToFavorite()
    recipe.isFavorite = true
  }
  
  func removeRecipeFromFavorite() {
    interactor.removeRecipeFromFavorite()
    recipe.isFavorite = false
  }
}
