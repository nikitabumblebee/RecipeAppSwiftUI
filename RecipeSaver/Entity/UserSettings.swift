//
//  UserSettings.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 01.02.2022.
//

import Foundation
import SwiftUI

/// Provides user settings in single instance (singleton pattern)
final class UserSettings {
    
    /// User's image
    var image = UIImage(systemName: "person.fill")
    
    var userName: String = "Nikita Shmelev"
    
    var userNickName: String = "@NikitaBumblebee"
    
    var language: String = "English"
    
    /// Is user switch on dark mode in the app
    var isDarkModeOn = false
    
    var darkModeAppearance = 1
    
    static var shared: UserSettings = {
        let instance = UserSettings()
        return instance
    }()
    
    private init() {
        // TODO: - add logic that loads local setting from device
    }
}
