//
//  DataModel.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 05.02.2022.
//

import Foundation
import Combine

final class DataModel {
    
    @Published var recipes: [Recipe] = []
    @Published var favoritesRecipes: [Recipe] = []
    @Published var myRecipes: [Recipe] = []
    
    private var persistence: Persistence = Persistence()
    private var cancellables = Set<AnyCancellable>()
    
    func load() {
        persistence.load()
            .assign(to: \.recipes, on: self)
            .store(in: &cancellables)
    }
    
    func save() {
        persistence.save(reipes: recipes)
    }
    
    func loadDefault(synchronous: Bool = false) {
        persistence.loadDefault(synchronous: synchronous)
            .assign(to: \.recipes, on: self)
            .store(in: &cancellables)
    }
    
    func addNewRecipe(recipe: Recipe) {
        recipes.insert(recipe, at: 0)
        myRecipes.insert(recipe, at: 0)
    }
    
    func updateRecipe(recipe: Recipe) {
        if let existedRecipeIndex = recipes.firstIndex(where: { $0.name == recipe.name }) {
            recipes[existedRecipeIndex] = recipe
        }
        if let existedRecipeIndex = myRecipes.firstIndex(where: { $0.name == recipe.name }) {
            myRecipes[existedRecipeIndex] = recipe
        }
        favoritesRecipes = recipes.filter { $0.isFavorite }
    }
    
    func removeRecipe(recipe: Recipe) {
        recipes.removeAll { $0.id == recipe.id }
    }
    
    func resetFavorites() {
        recipes.indices.forEach { recipes[$0].isFavorite = false }
        favoritesRecipes = []
    }
}

extension DataModel: ObservableObject { }

/// Extension for SwiftUI previews
#if DEBUG
extension DataModel {
    static var sample: DataModel {
        let model = DataModel()
        model.loadDefault(synchronous: true)
        return model
    }
}
#endif
