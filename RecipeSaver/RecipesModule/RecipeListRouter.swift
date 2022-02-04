//
//  RecipeListRouter.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 04.02.2022.
//

import SwiftUI

class RecipeListRouter {
  func moveToRecipe(recipe: Recipe) -> some View {
    return RecipeView(recipe: recipe)
  }
}
