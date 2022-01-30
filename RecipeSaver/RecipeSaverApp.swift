//
//  RecipeSaverApp.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 21.01.2022.
//

import SwiftUI

@main
struct RecipeSaverApp: App {
  @StateObject var recipeViewModel = RecipesViewModel()
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(recipeViewModel)
    }
  }
}
