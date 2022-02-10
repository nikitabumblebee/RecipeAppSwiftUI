//
//  RecipeCardViewModel.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 30.01.2022.
//

import Foundation
import SwiftUI
import Combine

class RecipeCardPresenter: ObservableObject {
    @Published private(set) var isFavorite: Bool = false
    @Published private(set) var name: String = ""
    @Published private(set) var imagePath: String = ""
    @Published private(set) var cookTime: String = "0"
    
    private var cancellables = Set<AnyCancellable>()
    private var interactor: RecipeCardInteractor
    
    init(interactor: RecipeCardInteractor) {
        self.interactor = interactor
        
        interactor.recipe.$isFavorite
            .assign(to: \.isFavorite, on: self)
            .store(in: &cancellables)
        
        interactor.recipe.$name
            .assign(to: \.name, on: self)
            .store(in: &cancellables)
        
        interactor.recipe.$image
            .assign(to: \.imagePath, on: self)
            .store(in: &cancellables)
        
        interactor.recipe.$cookTime
            .assign(to: \.cookTime, on: self)
            .store(in: &cancellables)
    }
    
    func changeFavoriteStatus() {
        if !isFavorite {
            interactor.addRecipeToFavorite()
        } else {
            interactor.removeRecipeFromFavorite()
        }
    }
}
