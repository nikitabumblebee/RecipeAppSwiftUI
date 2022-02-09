//
//  MyRecipesInteractor.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 09.02.2022.
//

import Foundation

class MyRecipesInteractor {
    var model: DataModel
    
    @Published var recipes: [Recipe] = []
    
    init(recipes: [Recipe], model: DataModel) {
        self.recipes = recipes
        self.model = model
    }
}
