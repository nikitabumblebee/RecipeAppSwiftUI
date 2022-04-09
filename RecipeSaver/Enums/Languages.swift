//
//  Languages.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 28.02.2022.
//

import Foundation

enum Languages: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    case English = "English"
    case Russian = "Русский"
}
