//
//  FavoritesView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 21.01.2022.
//

import SwiftUI

struct FavoritesView: View {
  @ObservedObject var presenter: FavoritesPresenter
  @EnvironmentObject var model: DataModel
  
  var body: some View {
    NavigationView {
      ScrollView {
        if presenter.favoriteRecipes.count > 0 {
          RecipeListView(presenter: RecipeListPresenter(interactor: RecipeListInteractor(recipes: model.recipes.filter { $0.isFavorite }, model: model)))
        }
        else {
          Text("You haven't saved any recipe to your favorites yet.")
            .padding()
        }
      }
      .navigationTitle("Favorites")
    }
    .navigationViewStyle(.stack)
    .environmentObject(model)
  }
}

struct FavoritesView_Previews: PreviewProvider {
  static var previews: some View {
    let model = DataModel.sample
    let presenter = FavoritesPresenter(interactor: FavoritesInteractor(model: model, recipes: model.recipes.filter { $0.isFavorite }))
    FavoritesView(presenter: presenter)
  }
}
