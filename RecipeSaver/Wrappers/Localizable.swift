//
//  Localizable.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 25.02.2022.
//

import Foundation

@propertyWrapper
struct Localizable {
    private let key: String
    var wrappedValue: String {
        return key.localized()
    }
    
    init(wrappedValue: String) {
        key = wrappedValue
    }
}


extension String {
    fileprivate func localized(bundle: Bundle = AppLanguageManager.shared.bundle, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, bundle: bundle, comment: "")
    }
}
