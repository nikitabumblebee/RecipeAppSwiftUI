//
//  MyRecipesView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 09.02.2022.
//

import SwiftUI

struct MyRecipesView: View {
    @EnvironmentObject var model: DataModel
    @ObservedObject var presenter: MyRecipesPresenter
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    NavigationHeaderView()
                    Spacer()
                }
                if model.recipes.filter { $0.isUserRecipe }.count > 0 {
                    ScrollView {
                        RecipeListView(presenter: RecipeListPresenter(interactor: RecipeListInteractor(recipes: presenter.recipes, model: model)))
                    }
                    .padding(.top, 10.0)
                    .navigationTitle("My Recipes")
                } else {
                    Text("You don't have your own recipes")
                        .navigationTitle("My Recipes")
                }
                Rectangle()
                    .frame(height: 0)
            }
            .toolbar {
                presenter.makeNewRecipe(model: model)
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct MyRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        MyRecipesView(presenter: MyRecipesPresenter(interactor: MyRecipesInteractor(recipes: DataModel.sample.recipes, model: DataModel.sample)))
    }
}
