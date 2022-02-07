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
  
  init(interactor: RecipeDescriptionInteractor) {
    self.interactor = interactor
  }
  
  func moveToEdit(for recipe: Binding<Recipe>, isEdit: Binding<Bool>) -> some View {
    let destination = router.editRecipe(for: recipe, isEdit: isEdit, model: interactor.model)
    return NavigationLink(destination: destination) {
      Text("Edit")
    }
  }
}
