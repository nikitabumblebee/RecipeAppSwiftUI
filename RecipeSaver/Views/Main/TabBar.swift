//
//  TabBar.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 21.01.2022.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
          HomeView()
            .tabItem {
              Label("Home", systemImage: "house")
            }
          
          CategoriesView()
            .tabItem {
              Label("Categories", systemImage: "square.fill.text.grid.1x2")
            }
          
          NewRecipeView()
            .tabItem {
              Label("New", systemImage: "plus")
            }
          
          FavoritesView(favoritesVM: FavoritesViewModel(recipes: Recipe.all.filter { $0.isFavorite }))
            .tabItem {
              Label("Favorites", systemImage: "heart")
            }
          
          SettingsView(settingsVM: SettingsViewModel())
            .tabItem {
              Label("Settings", systemImage: "gear")
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
        .environmentObject(RecipesViewModel())
    }
}
