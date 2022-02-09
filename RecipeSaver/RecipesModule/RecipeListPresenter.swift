//
//  RecipeListPresenter.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 04.02.2022.
//

import SwiftUI
import Combine

class RecipeListPresenter: ObservableObject {  
    private let interactor: RecipeListInteractor
    private var cancallables = Set<AnyCancellable>()
    private let router: RecipeListRouter
    
    @Published private(set) var recipes: [Recipe] = []
    
    init(interactor: RecipeListInteractor) {
        self.interactor = interactor
        self.router = RecipeListRouter()
        
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
}
