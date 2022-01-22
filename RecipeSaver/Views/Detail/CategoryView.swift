//
//  CategoryView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 22.01.2022.
//

import SwiftUI

struct CategoryView: View {
  var category: Category
  
  // Computed property
  var recipes: [Recipe] {
    return Recipe.all.filter { $0.category == category.rawValue }
  }
  
    var body: some View {
      ScrollView {
        RecipeList(recipes: recipes)
      }
      .navigationTitle(category.rawValue + "s")
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
      CategoryView(category: Category.main)
    }
}
