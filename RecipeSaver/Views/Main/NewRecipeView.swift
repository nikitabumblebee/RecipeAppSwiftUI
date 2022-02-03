//
//  NewRecipeView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 21.01.2022.
//

import SwiftUI

struct NewRecipeView: View {
  @State private var showAddRecipe = false
  @State private var recipe = Recipe(name: "", image: "", description: "", ingredients: "", directions: "", category: Category.main.rawValue, datePublished: "", url: "", isUserRecipe: true)
  @State private var isEdit = false
  @State private var recipeImage = UIImage(systemName: "photo")!
  
  var body: some View {
    NavigationView {
      Button("Add recipe manually") {
        showAddRecipe = true
      }
      .navigationTitle("New Recipe")
    }
    .navigationViewStyle(.stack)
    .sheet(isPresented: $showAddRecipe) {
      AddRecipeView(recipe: self.$recipe, isEdit: $isEdit)
    }
  }
}

struct NewRecipeView_Previews: PreviewProvider {
  static var previews: some View {
    NewRecipeView()
  }
}
