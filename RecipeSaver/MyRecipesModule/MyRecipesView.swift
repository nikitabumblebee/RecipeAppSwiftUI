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
                if presenter.recipes.count > 0 {
                    ScrollView {
                        RecipeListView(presenter: RecipeListPresenter(interactor: RecipeListInteractor(recipes: presenter.recipes, model: model)))
                    }
                    .padding(.top, 8)
                    .navigationTitle("My Recipes")
                } else {
                    Text("You don't have your own recipes")
                        .navigationTitle("My Recipes")
                }
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
        let model = DataModel.sample
        let interactor = MyRecipesInteractor(recipes: model.recipes as! [UserRecipe], model: model)
        let presenter = MyRecipesPresenter(interactor: interactor)
        MyRecipesView(presenter: presenter)
    }
}
