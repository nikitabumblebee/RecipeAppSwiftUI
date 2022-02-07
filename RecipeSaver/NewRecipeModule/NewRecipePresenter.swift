//
//  NewRecipePresenter.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 07.02.2022.
//

import Foundation
import SwiftUI

class NewRecipePresenter: ObservableObject {
  private let router = NewRecipeRouter()
  private let interactor: NewRecipeInteractor
  
  init(interactor: NewRecipeInteractor) {
    self.interactor = interactor
  }
  
  func makeNewRecipe() -> some View {
    NavigationLink(destination: router.makeNewRecipe(model: interactor.model)) {
      Text("Add recipe manually")
    }
  }
}
