//
//  SettingsViewModel.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 30.01.2022.
//

import Foundation
import SwiftUI

class SettingsViewModel: ObservableObject {  
  var isDarkModeEnabled: Bool = false
  
  var userSettings: UserSettings
      
  init() {
    userSettings = UserSettings.shared
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
}
