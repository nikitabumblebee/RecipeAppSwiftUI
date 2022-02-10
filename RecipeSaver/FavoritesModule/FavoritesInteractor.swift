//
//  FavoritesInteractor.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 05.02.2022.
//

import Foundation
import Combine

class FavoritesInteractor {
    let model: DataModel
    private var cancellables = Set<AnyCancellable>()
    
    @Published var favoriteRecipes: [Recipe] = []
    
    init(model: DataModel, recipes: [Recipe]) {
        self.model = model
        self.favoriteRecipes = recipes
    }
}
