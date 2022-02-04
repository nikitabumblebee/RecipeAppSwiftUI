//
//  RecipeSaverApp.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 21.01.2022.
//

import SwiftUI

@main
struct RecipeSaverApp: App {
  @StateObject var recipePresenter = RecipeListPresenter(interactor: RecipeListInteractor(recipes: Recipe.all))
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(recipePresenter)
    }
  }
}
