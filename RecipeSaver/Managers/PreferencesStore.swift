//
//  PreferencesStore.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 30.01.2022.
//

import Foundation
import SwiftUI

class PreferencesStore: ObservableObject {
  
  // ---------------------------------------
  // START: COLOR SCHEME
  // ---------------------------------------
  // 0: auto
  // 1: light
  // 2: dark
  //
  // See updateStoredColorScheme() below
  //
  @AppStorage(wrappedValue: 2, "colorScheme")
  public var appColorScheme:Int
  // Update this to change how the entire view hierarchy looks
  @Published public var colorScheme:InternalColorScheme = .initial
  // Updated in ContentView() via an onChange() listener
  public static var deviceColorScheme:ColorScheme = .light
  // ---------------------------------------
  // END: COLOR SCHEME
  // ---------------------------------------
  init() {
    // Default to what is stored in UserDefaults, which causes the entire
    // view hierarchy the update via .colorScheme() because colorScheme
    // is a @Published variable
    self.colorScheme = InternalColorScheme(code: appColorScheme)
  }
  
  // call this when the end user wants to change the color scheme
  public func updateStoredColorScheme(colorScheme:InternalColorScheme) {
    if colorScheme == .auto {
      
      // update UserDefaults
      appColorScheme = 0
      // Change the appearance
      if PreferencesStore.deviceColorScheme == .light {
        self.colorScheme = .light
      } else {
        self.colorScheme = .dark
      }
    } else if colorScheme == .light {
      appColorScheme = 1
      self.colorScheme = .light
    } else {
      appColorScheme = 2
      self.colorScheme = .dark
    }
  }
}
