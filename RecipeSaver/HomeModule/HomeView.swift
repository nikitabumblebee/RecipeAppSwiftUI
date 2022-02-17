//
//  HomeView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 21.01.2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: DataModel
        
    @State var searchQuery = ""
    @State var filteredRecipes: [Recipe] = []
    
    @ObservedObject var presenter: HomePresenter
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationHeaderView()
                if searchQuery != "" {
                    List {
                        ForEach(filteredRecipes) { recipe in
                            presenter.makeRecipeSearchNavigation(recipe: recipe, model: model)
                        }
                    }
                    .navigationTitle("Home")
                } else {
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
                                        ForEach(presenter.newRecipes) { recipe in
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
                                        ForEach(presenter.vegetarianRecipes) { recipe in
                                            presenter.routeToRecipe(recipe: recipe)
                                                .frame(width: 210, height: 290)
                                                .padding(.top, -20.0)
                                        }
                                    }
                                }
                            }
                            .padding([.top, .leading, .trailing], -10.0)
                        }
//                        VStack {
//                            Text("Site")
//                            Text(presenter.siteContent)
//                        }
                    }
                    .navigationTitle("Home")
                }
            }
        }
        .searchable(text: $searchQuery, prompt: "Search By Meal Name")
        .onChange(of: searchQuery) { _ in
            filteredRecipes = presenter.filterRecipes(searchQuery: searchQuery, model: model)
        }
        .onSubmit(of: .search) {
            filteredRecipes = presenter.filterRecipes(searchQuery: searchQuery, model: model)
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
