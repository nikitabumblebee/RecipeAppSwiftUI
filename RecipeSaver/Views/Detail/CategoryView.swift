//
//  CategoryView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 22.01.2022.
//

import SwiftUI

struct CategoryView: View {
    @EnvironmentObject var model: DataModel
    
    var category: Category
    
    // Computed property
    var recipes: [Recipe] {
        return model.recipes.filter { $0.category == category.rawValue }
    }
    
    var body: some View {
        ZStack {
            VStack {
                NavigationHeaderView()
                ScrollView {
                    RecipeListView(presenter: RecipeListPresenter(interactor: RecipeListInteractor(recipes: recipes, model: model)))
                }
                .navigationTitle(category.rawValue + "s")
            }
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        let model = DataModel.sample
        CategoryView(category: Category.main)
            .environmentObject(model)
    }
}
