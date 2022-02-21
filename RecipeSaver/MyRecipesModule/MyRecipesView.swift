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
                        VStack {
                            HStack {
                                Text("\(presenter.recipes.count) \(presenter.recipes.count > 1 ? "recipes" : "recipe")")
                                    .font(.headline)
                                    .fontWeight(.medium)
                                    .opacity(0.7)
                                Spacer()
                            }
                            .padding([.top, .leading])
                            
                            List {
                                ForEach(presenter.recipes) { recipe in
                                    presenter.routeToRecipe(recipe: recipe)
                                        .swipeActions(allowsFullSwipe: false) {
                                            Button {
                                                presenter.changeFavoriteStatus(recipe: recipe)
                                            } label: {
                                                Label("Favorite", systemImage: "heart.fill")
                                            }
                                            .tint(Color.indigo)
                                            
                                            Button(role: .destructive) {
                                                presenter.deleteRecipe(recipe: recipe)
                                            } label: {
                                                Label("Delete", systemImage: "trash.fill")
                                            }
                                        }
                                }
                            }
                            .listStyle(.grouped)
                            .padding(.top, 8)
                            .navigationTitle("My Recipes")
                        }
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
