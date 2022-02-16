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
            VStack {
                ZStack {
                    VStack {
                        NavigationHeaderView()
                        Spacer()
                    }
                    if presenter.recipes.count > 0 {
                        List {
                            ForEach(presenter.recipes) { recipe in
                                presenter.routeToRecipe(recipe: recipe)
                            }
                            .onDelete { indexSet in
                                presenter.deleteRecipe(at: indexSet)
                            }
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
                Rectangle()
                    .frame(height: 0.0)
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
