//
//  RecipeDescriptionPresenter.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 07.02.2022.
//

import Foundation
import SwiftUI

class RecipeDescriptionPresenter: ObservableObject {
    private let router = RecipeDescriptionRouter()
    private let interactor: RecipeDescriptionInteractor
    
    @Published private(set) var recipe: Recipe
    @Published private(set) var recipeImage: UIImage!
    @Published private(set) var imageName: String
    @Published private(set) var recipeName: String
    @Published private(set) var isUserRecipe: Bool
    @Published private(set) var description: String
    @Published private(set) var ingredients: String
    @Published private(set) var directions: String
    
    init(interactor: RecipeDescriptionInteractor, recipe: Recipe) {
        self.interactor = interactor
        self.recipe = recipe
        self.imageName = recipe.image
        self.recipeName = recipe.name
        if recipe.recipeType.contains(RecipeType.user.rawValue) {
            self.isUserRecipe = true
        } else {
            self.isUserRecipe = false
        }
        self.description = recipe.description
        self.ingredients = recipe.ingredients
        self.directions = recipe.directions
        let imageLoader = ImageLoader()
        self.recipeImage = imageLoader.loadImageFromDiskWith(fileName: recipe.image)
    }
    
    func moveToEdit(for recipe: Binding<Recipe>, isEdit: Binding<Bool>) -> some View {
        let destination = router.editRecipe(for: recipe, isEdit: isEdit, model: interactor.model)
        return NavigationLink(destination: destination) {
            Text("Edit")
        }
    }
}
