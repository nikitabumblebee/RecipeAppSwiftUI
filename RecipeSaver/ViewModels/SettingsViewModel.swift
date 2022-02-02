//
//  SettingsViewModel.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 30.01.2022.
//

import Foundation

class SettingsViewModel: ObservableObject {  
  var isDarkModeEnabled: Bool = false
  var userName: String
  var userNickName: String
  var userSettings: UserSettings
      
  init() {
    userSettings = UserSettings.shared
    userName = userSettings.userName
    userNickName = userSettings.userNickName
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
