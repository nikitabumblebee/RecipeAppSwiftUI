//
//  UserSettings.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 01.02.2022.
//

import Foundation
import UIKit


/// Provides user settings in single instance (singleton pattern)
class UserSettings {
  
  /// User's image
  var image = UIImage(systemName: "person.fill")
  
  /// Is user switch on dark mode in the app
  var isDarkModeOn = false
  
  static var shared: UserSettings = {
    
    let instance = UserSettings()
    return instance
  }()
  
  private init() {
    // TODO: - add logic that loads local setting from device
  }
}
