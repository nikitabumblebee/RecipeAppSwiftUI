//
//  RecipeCard.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 22.01.2022.
//

import SwiftUI

struct RecipeCardView: View {
  @ObservedObject var presenter: RecipeCardPresenter
  @EnvironmentObject var model: DataModel
  
  var body: some View {
    VStack {
      AsyncImage(url: URL(string: presenter.recipe.image)) { image in
        image
          .resizable()
          .aspectRatio(contentMode: .fill)
      } placeholder: {
        if presenter.recipe.image != presenter.recipe.name {
          Image(systemName: "photo")
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40, alignment: .center)
            .foregroundColor(.white.opacity(0.7))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
          let imageLoader = ImageLoader()
          Image(uiImage: imageLoader.loadImageFromDiskWith(fileName: presenter.recipe.image)!)
            .resizable()
            .aspectRatio(contentMode: .fill)
        }
      }
      .overlay(alignment: .bottomTrailing) {
        RecipeTextName(name: presenter.recipe.name)
      }
      .overlay(alignment: .topTrailing) {
        Button {
          if presenter.recipe.isFavorite {
            presenter.removeRecipeFromFavorite()
          }
          else {
            presenter.addRecipeToFavorite()
          }
        } label: {
          ZStack {
            Image(systemName: "heart.fill")
              .imageScale(.large)
              .foregroundColor(presenter.recipe.isFavorite ? Color.red : Color.white.opacity(0.8))
              .font(.system(size: 30))
            Image(systemName: "heart")
              .imageScale(.large)
              .foregroundColor(Color.white)
              .font(.system(size: 30))
          }
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
    let model = DataModel.sample
    RecipeCardView(presenter: RecipeCardPresenter(interactor: RecipeCardInteractor(model: model, recipe: model.recipes[0])))
  }
}
