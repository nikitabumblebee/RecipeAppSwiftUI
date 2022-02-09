//
//  RecipeView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 22.01.2022.
//

import SwiftUI

struct RecipeView: View {
  @EnvironmentObject var model: DataModel
  @State var recipe: Recipe
  @State private var isEdit = true
  @State private var recipeImage = UIImage(systemName: "photo")
  
  @ObservedObject var presenter: RecipeDescriptionPresenter
  
  var body: some View {
    ScrollView {
      AsyncImage(url: URL(string: recipe.image)) { image in
        image
          .resizable()
          .aspectRatio(contentMode: .fill)
      } placeholder: {
        if recipe.image != recipe.name {
          Image(systemName: "photo")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100, alignment: .center)
            .foregroundColor(.white.opacity(0.7))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
          Image(uiImage: recipeImage!)
            .resizable()
        }
      }
      .frame(height: 300)
      .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
      
      VStack(spacing: 30) {
        Text(recipe.name)
          .font(.largeTitle)
          .bold()
          .multilineTextAlignment(.center)
        
        VStack(alignment: .leading, spacing: 30) {
          if !recipe.description.isEmpty {
            Text(recipe.description)
          }
          
          if !recipe.ingredients.isEmpty {
            VStack(alignment: .leading, spacing: 20) {
              Text("Ingredients")
                .font(.headline)
              
              Text(recipe.ingredients)
            }
          }
          
          if !recipe.directions.isEmpty {
            VStack(alignment: .leading, spacing: 20) {
              Text("Directions")
                .font(.headline)
              
              Text(recipe.directions)
            }
          }
        }
      }
      .padding(.horizontal)
    }
    .onAppear {
      if let existedRecipeIndex = model.recipes.firstIndex(where: { $0.id == recipe.id }) {
        let imageLoader = ImageLoader()
        self.recipeImage = imageLoader.loadImageFromDiskWith(fileName: model.recipes[existedRecipeIndex].image)
        self.recipe = model.recipes[existedRecipeIndex]
      }
    }
    .toolbar {
      if recipe.isUserRecipe {
        presenter.moveToEdit(for: $recipe, isEdit: $isEdit)
      }
    }
    .ignoresSafeArea(.container, edges: .top)
  }
}

struct RecipeView_Previews: PreviewProvider {
  static var previews: some View {
    let model = DataModel.sample
    RecipeView(recipe: model.recipes[0], presenter: RecipeDescriptionPresenter(interactor: RecipeDescriptionInteractor(model: model)))
  }
}
