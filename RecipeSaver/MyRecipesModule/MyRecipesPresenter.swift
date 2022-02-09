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
            .assign(to: \.recipes, on: self)
            .store(in: &cancallables)
    }
    
    func routeToRecipe(recipe: Recipe) -> some View {
        let destination = router.moveToRecipe(recipe: recipe, model: interactor.model)
        return NavigationLink(destination: destination) {
            RecipeCardView(presenter: RecipeCardPresenter(interactor: RecipeCardInteractor(model: interactor.model, recipe: recipe)))
        }
    }
    
    func makeNewRecipe(model: DataModel) -> some View {
        let destination = router.makeNewRecipe(model: model)
        return NavigationLink(destination: destination) {
            Text("Add")
        }
    }
}
