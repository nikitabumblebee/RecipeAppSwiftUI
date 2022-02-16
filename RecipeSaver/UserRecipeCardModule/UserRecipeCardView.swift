//
//  UserRecipeCardView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 16.02.2022.
//

import SwiftUI

struct UserRecipeCardView: View {
    @ObservedObject var presenter: RecipeCardPresenter
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: presenter.imagePath)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                let imageLoader = ImageLoader()
                if (presenter.imagePath != presenter.name || imageLoader.loadImageFromDiskWith(fileName: presenter.imagePath) == nil) {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(.white.opacity(0.7))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    Image(uiImage: imageLoader.loadImageFromDiskWith(fileName: presenter.imagePath)!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
            }
            .overlay(alignment: .topLeading) {
                VStack {
                    HStack {
                        VStack {
                            Image(systemName: "timer")
                                .imageScale(.large)
                            Text("\(presenter.cookTime) mins")
                                .font(.headline)
                        }
                        .foregroundColor(Color.yellow)
                        .font(.system(size: 20))
                        .shadow(color: .black, radius: 2, x: 0, y: 0)
                        .padding()
                        
                        Spacer()
                        
                        Button {
                            presenter.changeFavoriteStatus()
                        } label: {
                            ZStack {
                                Image(systemName: "heart.fill")
                                    .imageScale(.large)
                                    .foregroundColor(presenter.isFavorite ? Color.red : Color.white.opacity(0.8))
                                    .font(.system(size: 30))
                                Image(systemName: "heart")
                                    .imageScale(.large)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 30))
                            }
                        }
                        .shadow(color: .black, radius: 15, x: 0, y: 0)
                        .padding()
                    }
                    UserRecipeTextName(name: presenter.name)
                }
            }
        }
        .frame(height: 120, alignment: .topTrailing)
        .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

struct UserRecipeTextName: View {
    let name: String
    var body: some View {
        Text(name)
            .font(.headline)
            .foregroundColor(.white)
            .shadow(color: .black, radius: 3, x: 0, y: 0)
            .frame(maxWidth: 180)
    }
}

struct UserRecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        let model = DataModel.sample
        UserRecipeCardView(presenter: RecipeCardPresenter(interactor: RecipeCardInteractor(model: model, recipe: model.recipes[0])))
    }
}
