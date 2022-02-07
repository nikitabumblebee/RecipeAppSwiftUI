//
//  AddRecipePresenter.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 07.02.2022.
//

import Foundation
import SwiftUI
import Combine

class AddRecipePresenter: ObservableObject {
  @Published var recipe: Recipe
  @Published var recipeImage: UIImage
  
  private let interactor: AddRecipeInteractor
  
  private var cancellables = Set<AnyCancellable>()
  
  init(interactor: AddRecipeInteractor, recipe: Recipe, recipeImage: UIImage) {
    self.interactor = interactor
    self.recipe = recipe
    self.recipeImage = recipeImage
  }
  
  func saveRecipe(recipeImage: UIImage) {
    let imageLoader = ImageLoader()
    imageLoader.saveImage(imageName: recipe.name, image: recipeImage)
    interactor.saveRecipe(recipe: recipe)
  }
  
  func loadRecipeImage() -> UIImage {
    let imageLoader = ImageLoader()
    return imageLoader.loadImageFromDiskWith(fileName: recipe.name)!
  }
  
  func updateRecipe(recipeImage: UIImage) {
    let imageLoader = ImageLoader()
    imageLoader.saveImage(imageName: recipe.name, image: recipeImage)
    interactor.updateRecipe(recipe: recipe)
  }
}
