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
    
  init() {
    
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
  
  private func handlePickedBackgroundImage(_ image: UIImage?) {
    //profileImage = image?.imageData
  }
}
