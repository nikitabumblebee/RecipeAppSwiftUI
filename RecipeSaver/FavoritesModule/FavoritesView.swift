//
//  FavoritesView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 21.01.2022.
//

import SwiftUI

struct FavoritesView: View {
  @ObservedObject var favoritesVM: FavoritesViewModel
  
  var body: some View {
    NavigationView {
      ScrollView {
        if favoritesVM.recipes.count > 0 {
          RecipeListView(presenter: RecipeListPresenter(interactor: RecipeListInteractor(recipes: favoritesVM.recipes)))
        }
        else {
          Text("You haven't saved any recipe to your favorites yet.")
            .padding()
        }
      }
      .navigationTitle("Favorites")
    }
    .navigationViewStyle(.stack)
    .onAppear {
      self.favoritesVM.fetchData()
    }
  }
}

struct FavoritesView_Previews: PreviewProvider {
  static var previews: some View {
    FavoritesView(favoritesVM: FavoritesViewModel(recipes: Recipe.all.filter { $0.isFavorite }))
  }
}
