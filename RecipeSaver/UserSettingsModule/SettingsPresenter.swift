//
//  SettingsPresenter.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 04.02.2022.
//

import SwiftUI

class SettingsPresenter: ObservableObject {
  private let interactor: SettingsInteractor
  
  private let router: SettingsRouter
  
  init(interactor: SettingsInteractor) {
    self.interactor = interactor
    self.router = SettingsRouter()
  }
  
  func switchDarkMode(isDarkModeEnabled: Bool) {
    if isDarkModeEnabled {
      interactor.turnOnDarkMode()
    } else {
      interactor.turnOffDarkMode()
    }
  }
  
  func turnOffDarkMode() {
    interactor.turnOffDarkMode()
  }
  
  func turnOnDarkMode() {
    interactor.turnOnDarkMode()
  }
  
  func resetFavorites() {
    interactor.resetFavorites()
  }
  
  func routeToEditSettingsView() -> some View {
    let destination = router.editProfile()
    return NavigationLink(destination: destination) {
      HStack {
        Spacer()
        Text("Edit")
      }
    }
  }
}
