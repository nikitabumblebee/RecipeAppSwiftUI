//
//  RecipeList.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 22.01.2022.
//

import SwiftUI

struct RecipeListView: View {
    @ObservedObject var presenter: RecipeListPresenter
    
    var body: some View {
        VStack {
            HStack {
                Text("\(presenter.recipes.count) \(presenter.recipes.count > 1 ? "recipes" : "recipe")")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.7)
                Spacer()
            }
            .padding(.top, 10.0)
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                ForEach(presenter.recipes) { recipe in
                    presenter.routeToRecipe(recipe: recipe)
                }
            }
            .padding(.top)
        }
        .padding(.horizontal)
    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            let model = DataModel.sample
            let presenter = RecipeListPresenter(interactor: RecipeListInteractor(recipes: model.recipes, model: model))
            RecipeListView(presenter: presenter)
        }
    }
}
