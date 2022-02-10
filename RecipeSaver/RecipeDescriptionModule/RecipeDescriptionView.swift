//
//  RecipeView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 22.01.2022.
//

import SwiftUI

struct RecipeDescriptionView: View {
    @EnvironmentObject var model: DataModel
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var presenter: RecipeDescriptionPresenter
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView(showsIndicators: true) {
                    AsyncImage(url: URL(string: presenter.imageName)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        if presenter.imageName != presenter.recipeName || presenter.recipeImage == nil {
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100, alignment: .center)
                                .foregroundColor(.white.opacity(0.7))
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        } else {
                            Image(uiImage: presenter.recipeImage!)
                                .resizable()
                        }
                    }
                    .frame(height: 300)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
                    
                    VStack(spacing: 30) {
                        Text(presenter.recipeName)
                            .font(.largeTitle)
                            .bold()
                            .multilineTextAlignment(.center)
                        
                        VStack(alignment: .leading, spacing: 30) {
                            if !presenter.description.isEmpty {
                                Text(presenter.description)
                            }
                            
                            if !presenter.ingredients.isEmpty {
                                VStack(alignment: .leading, spacing: 20) {
                                    Text("Ingredients")
                                        .font(.headline)
                                    Text(presenter.ingredients)
                                }
                            }
                            
                            if !presenter.directions.isEmpty {
                                VStack(alignment: .leading, spacing: 20) {
                                    Text("Directions")
                                        .font(.headline)
                                    Text(presenter.directions)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .ignoresSafeArea(.container, edges: .top)
                .toolbar {
                    if presenter.isUserRecipe {
                        let recipe = Binding(get: { return presenter.recipe }, set: {_ in })
                        let isEdit = Binding(get: { return true }, set: { _ in })
                        presenter.moveToEdit(for: recipe, isEdit: isEdit)
                    }
                }
                Rectangle()
                    .frame(height: 0)
            }
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        let model = DataModel.sample
        RecipeDescriptionView(presenter: RecipeDescriptionPresenter(interactor: RecipeDescriptionInteractor(model: model), recipe: model.recipes[0]))
    }
}
