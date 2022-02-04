//
//  CategoryView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 22.01.2022.
//

import SwiftUI

struct CategoryView: View {
  @EnvironmentObject var recipesVM: RecipeListPresenter
  
  var category: Category
  
  // Computed property
  var recipes: [Recipe] {
    return recipesVM.recipes.filter { $0.category == category.rawValue }
  }
  
    var body: some View {
      ScrollView {
        RecipeListView(presenter: RecipeListPresenter(interactor: RecipeListInteractor(recipes: recipes)))
      }
      .navigationTitle(category.rawValue + "s")
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
      CategoryView(category: Category.main)
        .environmentObject(RecipeListPresenter(interactor: RecipeListInteractor(recipes: Recipe.all)))
    }
}
