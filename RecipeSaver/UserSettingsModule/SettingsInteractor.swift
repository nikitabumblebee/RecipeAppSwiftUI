//
//  SettingsInteractor.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 04.02.2022.
//

import Foundation

class SettingsInteractor {
  private let userSettings: UserSettings

  init() {
    self.userSettings = UserSettings.shared
  }
  
  func turnOnDarkMode() {
    userSettings.darkModeAppearance = 2
    UserDefaults.standard.set(userSettings.darkModeAppearance, forKey: "selectedAppearance")
  }
  
  func turnOffDarkMode() {
    userSettings.darkModeAppearance = 1
    UserDefaults.standard.set(userSettings.darkModeAppearance, forKey: "selectedAppearance")
  }
  
  func resetFavorites() {
    //Recipe.resetFavorites()
  }
  
  func updateUserName(name: String) {
    userSettings.userName = name
  }
}
