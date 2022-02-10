//
//  HomeView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 21.01.2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: DataModel
    
    @ObservedObject var presenter: HomePresenter
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    NavigationHeaderView()
                    ScrollView {
                        VStack {
                            HStack {
                                Text("New")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            .padding([.top, .leading, .trailing])
                            
                            HStack {
                                ScrollView(.horizontal) {
                                    HStack(spacing: -30) {
                                        ForEach(presenter.recipes) { recipe in
                                            presenter.routeToRecipe(recipe: recipe)
                                                .frame(width: 210, height: 290)
                                                .padding(.top, -20.0)
                                        }
                                    }
                                }
                            }
                            .padding([.top, .leading, .trailing], -10.0)
                        }
                        VStack {
                            HStack {
                                Text("Vegeterian")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            .padding([.top, .leading, .trailing])
                            
                            HStack {
                                ScrollView(.horizontal) {
                                    HStack(spacing: -30) {
                                        ForEach(presenter.recipes) { recipe in
                                            presenter.routeToRecipe(recipe: recipe)
                                                .frame(width: 210, height: 290)
                                                .padding(.top, -20.0)
                                        }
                                    }
                                }
                            }
                            .padding([.top, .leading, .trailing], -10.0)
                        }
                    }
                    .navigationTitle("Home")
                    Rectangle()
                        .frame(height: 0)
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let model = DataModel.sample
        HomeView(presenter: HomePresenter(interactor: RecipeListInteractor(recipes: model.recipes, model: model)))
            .environmentObject(model)
    }
}
