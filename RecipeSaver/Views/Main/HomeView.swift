//
//  HomeView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 21.01.2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: DataModel
    
    var body: some View {
        NavigationView {
            ZStack {
                ApplicationBackgroundColor()
                VStack {
                    NavigationHeaderView()
                    ScrollView {
                        RecipeListView(presenter: RecipeListPresenter(interactor: RecipeListInteractor(recipes: model.recipes, model: model)))
                    }
                    .navigationTitle("My Recipes")
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
        HomeView()
            .environmentObject(model)
    }
}
