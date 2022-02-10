//
//  FavoritesPresenter.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 05.02.2022.
//

import SwiftUI
import Combine

class FavoritesPresenter: ObservableObject {
    private let interactor: FavoritesInteractor
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var favoriteRecipes: [Recipe] = []
    
    init(interactor: FavoritesInteractor) {
        self.interactor = interactor
        
        interactor.model.$recipes
            .map { array in
                array.filter { $0.isFavorite }
            }
            .assign(to: \.favoriteRecipes, on: self)
            .store(in: &cancellables)
    }
}
