//
//  HomeView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 21.01.2022.
//

import SwiftUI

struct HomeView: View {
  //@EnvironmentObject var model:
  @EnvironmentObject var model: RecipeListPresenter
  
  var body: some View {
    NavigationView {
      ScrollView {
        RecipeListView(presenter: RecipeListPresenter(interactor: RecipeListInteractor(recipes: Recipe.all)))
      }
      .navigationTitle("My Recipes")
    }
    .navigationViewStyle(.stack)
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
      .environmentObject(RecipeListPresenter(interactor: RecipeListInteractor(recipes: Recipe.all)))
  }
}
