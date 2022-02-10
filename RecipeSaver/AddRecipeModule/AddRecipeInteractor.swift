//
//  AddRecipeInteractor.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 07.02.2022.
//

import Foundation
import Combine

class AddRecipeInteractor {
    let model: DataModel
    
    init(model: DataModel) {
        self.model = model
    }
    
    func saveRecipe(recipe: Recipe) {
        let datePublished = createDate()
        let newRecipe = UserRecipe(name: recipe.name, image: recipe.name, description: recipe.description, ingredients: recipe.ingredients, directions: recipe.directions, category: recipe.category, datePublished: datePublished, url: "", cookTime: recipe.cookTime)
        model.addNewRecipe(recipe: newRecipe)
    }
    
    func updateRecipe(recipe: Recipe) {
        if let row = model.recipes.firstIndex(where: { $0.id == recipe.id }) {
            let existedRecipe = model.recipes[row]
            existedRecipe.name = recipe.name
            existedRecipe.image = recipe.name
            existedRecipe.description = recipe.description
            existedRecipe.ingredients = recipe.ingredients
            existedRecipe.directions = recipe.directions
            existedRecipe.category = recipe.category
            existedRecipe.cookTime = recipe.cookTime
            existedRecipe.datePublished = createDate()
            model.updateRecipe(recipe: existedRecipe)
            model.recipes[row] = existedRecipe
        }
    }
    
    private func createDate() -> String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        let datePublished = dateFormatter.string(from: now)
        return datePublished
    }
}
