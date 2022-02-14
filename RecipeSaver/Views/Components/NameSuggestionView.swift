//
//  NameSuggestionView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 14.02.2022.
//

import SwiftUI

struct NameSuggestionView: View {
    @EnvironmentObject var model: DataModel
    
    @Binding var recipes: [Recipe]
    
    var body: some View {
        let names = recipes.map { $0.name }
        List {
//            ForEach(names, id: \.self) { suggestion in
//                Text(suggestion)
//                    .searchCompletion(suggestion)
//            }
            ForEach(model.recipes) { recipe in
                NavigationLink(destination: RecipeDescriptionView(presenter: RecipeDescriptionPresenter(interactor: RecipeDescriptionInteractor(model: model), recipe: recipe))) {
                    Text(recipe.name)
                }
            }
        }
    }
}

struct NameSuggestionView_Previews: PreviewProvider {
    static var previews: some View {
        let recipes = Binding(get: { return DataModel.sample.recipes }, set: { _ in })
        NameSuggestionView(recipes: recipes)
    }
}
