//
//  TabBar.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 21.01.2022.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var model: DataModel
    
    var body: some View {
        TabView {
            HomeView(presenter: HomePresenter(interactor: RecipeListInteractor(recipes: model.recipes, model: model)))
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            CategoriesView(presenter: CategoriesPresenter())
                .tabItem {
                    Label("Categories", systemImage: "square.fill.text.grid.1x2")
                }
            
            MyRecipesView(presenter: MyRecipesPresenter(interactor: MyRecipesInteractor(recipes: model.recipes, model: model)))
                .tabItem {
                    Label("My Recipes", systemImage: "book.fill")
                }
            
            FavoritesView(presenter: FavoritesPresenter(interactor: FavoritesInteractor(model: model, recipes: model.recipes.filter { $0.isFavorite })))
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
            
            SettingsView(presenter: SettingsPresenter(interactor: SettingsInteractor(model: model)))
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        let model = DataModel.sample
        TabBarView()
            .environmentObject(model)
    }
}
