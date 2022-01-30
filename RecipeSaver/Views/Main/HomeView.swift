//
//  HomeView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 21.01.2022.
//

import SwiftUI

struct HomeView: View {
  @EnvironmentObject var recipesVM: RecipesViewModel
  
  var body: some View {
    NavigationView {
      ScrollView {
        RecipeList(recipes: recipesVM.recipes)
      }
      .navigationTitle("My Recipes")
    }
    .navigationViewStyle(.stack)
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
      .environmentObject(RecipesViewModel())
  }
}
