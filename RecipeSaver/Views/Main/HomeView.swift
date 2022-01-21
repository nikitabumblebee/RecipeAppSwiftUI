//
//  HomeView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 21.01.2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
      NavigationView {
        ScrollView {
          RecipeList(recipes: Recipe.all)
        }
        .navigationTitle("My Recipes")
      }
      .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
