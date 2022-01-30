//
//  RecipeCard.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 22.01.2022.
//

import SwiftUI

struct RecipeCard: View {
  @ObservedObject var recipeCardVM: RecipeCardViewModel
  
  var body: some View {
    VStack {
      AsyncImage(url: URL(string: recipeCardVM.recipe.image)) { image in
        image
          .resizable()
          .aspectRatio(contentMode: .fill)
      } placeholder: {
        Image(systemName: "photo")
          .resizable()
          .scaledToFit()
          .frame(width: 40, height: 40, alignment: .center)
          .foregroundColor(.white.opacity(0.7))
          .frame(maxWidth: .infinity, maxHeight: .infinity)
      }
      .overlay(alignment: .bottomTrailing) {
        RecipeTextName(name: recipeCardVM.recipe.name)
      }
      .overlay(alignment: .topTrailing) {
        Button {
          if recipeCardVM.recipe.isFavorite {
            recipeCardVM.removeRecipeFromFavorite()
          }
          else {
            recipeCardVM.addRecipeToFavorite()
          }
        } label: {
          if recipeCardVM.recipe.isFavorite {
            ZStack {
              Image(systemName: "heart.fill")
                .imageScale(.large)
                .foregroundColor(Color.red)
                .font(.system(size: 30))
              Image(systemName: "heart")
                .imageScale(.large)
                .foregroundColor(Color.white)
                .font(.system(size: 30))
            }
          } else {
            ZStack {
              Image(systemName: "heart.fill")
                .imageScale(.large)
                .foregroundColor(Color.white)
                .opacity(0.8)
                .font(.system(size: 30))
              Image(systemName: "heart")
                .imageScale(.large)
                .foregroundColor(Color.white)
                .font(.system(size: 30))
            }
          }
        }
        .onAppear {
          self.recipeCardVM.fetchData()
        }
        .shadow(color: .black, radius: 15, x: 0, y: 0)
        .padding(10)
      }
    }
    .frame(width: 160, height: 217, alignment: .topTrailing)
    .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 10)
  }
}

struct RecipeTextName: View {
  let name: String
  var body: some View {
    Text(name)
      .font(.headline)
      .foregroundColor(.white)
      .shadow(color: .black, radius: 3, x: 0, y: 0)
      .frame(maxWidth: 136)
      .padding()
  }
}

struct RecipeCard_Previews: PreviewProvider {
  static var previews: some View {
    RecipeCard(recipeCardVM: RecipeCardViewModel(recipe: Recipe.all[0]))
  }
}
