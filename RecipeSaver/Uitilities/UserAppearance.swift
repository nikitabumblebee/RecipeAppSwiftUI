//
//  Utilities.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 08.02.2022.
//

import Foundation
import SwiftUI

class UserAppearance {
  @AppStorage("selectedAppearance") var selectedAppearance = 0
  var userInterfaceStyle: ColorScheme? = .dark
  
  func overrideDisplayMode() {
    var userInterfaceStyle: UIUserInterfaceStyle
    
    if selectedAppearance == 2 {
      userInterfaceStyle = .dark
    } else if selectedAppearance == 1 {
      userInterfaceStyle = .light
    } else {
      userInterfaceStyle = .unspecified
    }
    
    UserDefaults.standard.set(selectedAppearance, forKey: "selectedAppearance")
    
    UIApplication.shared.windows.first?.overrideUserInterfaceStyle = userInterfaceStyle
  }
}
