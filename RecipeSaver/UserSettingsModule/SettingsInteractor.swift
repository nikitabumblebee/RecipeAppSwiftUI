//
//  SettingsInteractor.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 04.02.2022.
//

import Foundation

class SettingsInteractor {
  private let userSettings: UserSettings
  private var isDarkModeEnabled: Bool
  private var userName: String

  init() {
    self.userSettings = UserSettings.shared
    self.isDarkModeEnabled = false
    self.userName = userSettings.userName
  }
  
  func turnOnDarkMode() {
    isDarkModeEnabled = true
  }
  
  func turnOffDarkMode() {
    isDarkModeEnabled = false
  }
  
  func resetFavorites() {
    Recipe.resetFavorites()
  }
  
  func selectPhotoToProfile() {
    
  }
  
  func updateUserName(name: String) {
    userName = name
    userSettings.userName = name
  }
}
