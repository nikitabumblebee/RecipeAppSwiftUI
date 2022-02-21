//
//  MyRecipesPresenter.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 09.02.2022.
//

import SwiftUI
import Combine

class MyRecipesPresenter: ObservableObject {
    private let interactor: MyRecipesInteractor
    private var cancallables = Set<AnyCancellable>()
    private let router: MyRecipesRouter
    
    @Published private(set) var recipes: [Recipe] = []
    
    init(interactor: MyRecipesInteractor) {
        self.interactor = interactor
        self.router = MyRecipesRouter()
        
        interactor.$recipes
            .map { array in
                array.filter { $0.recipeType.contains(RecipeType.user.rawValue) }
            }
            .assign(to: \.recipes, on: self)
            .store(in: &cancallables)
    }
    
    func routeToRecipe(recipe: Recipe) -> some View {
        let destination = router.moveToRecipe(recipe: recipe, model: interactor.model)
        return NavigationLink(destination: destination) {
            UserRecipeCardView(presenter: RecipeCardPresenter(interactor: RecipeCardInteractor(model: interactor.model, recipe: recipe)))
        }
    }
    
    func makeNewRecipe(model: DataModel) -> some View {
        let destination = router.makeNewRecipe(model: model)
        return NavigationLink(destination: destination) {
            Text("Add")
        }
    }
    
    func deleteRecipe(at offset: IndexSet) {
        let recipeToDelete = offset.map { recipes[$0].id }.first!
        let recipe = recipes.first(where: { $0.id == recipeToDelete })
        interactor.model.removeRecipe(recipe: recipe!)
    }
    
    func deleteRecipe(recipe: Recipe) {
        interactor.model.removeRecipe(recipe: recipe)
    }
    
    func changeFavoriteStatus(recipe: Recipe) {
        recipe.isFavorite.toggle()
        interactor.model.updateRecipe(recipe: recipe)
    }
}
