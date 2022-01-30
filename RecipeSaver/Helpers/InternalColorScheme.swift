//
//  InternalColorScheme.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 30.01.2022.
//

import Foundation
import SwiftUI

public enum InternalColorScheme {
    case initial, auto, light, dark
    init(code:Int) {
        if code == 0 {
            self = .auto
        } else if code == 1 {
            self = .light
        } else {
            self = .dark
        }
    }
    public func systemColorScheme() -> ColorScheme {
        if self == .auto || self == .initial {
            return PreferencesStore.deviceColorScheme
        } else if self == .light {
            return .light
        } else {
            return .dark
        }
    }
}
