//
//  AppLanguageManager.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 25.02.2022.
//

import Foundation

final class AppLanguageManager {
    static let shared = AppLanguageManager()
    
    private(set) var currentLanguage: String
    private(set) var currentBundle: Bundle = Bundle.main
    var bundle: Bundle {
        return currentBundle
    }
    
    private init() {
        if let appLanguage = UserDefaults.standard.string(forKey: "AppLanguage") {
            currentLanguage = appLanguage
        } else {
            currentLanguage = Locale.current.languageCode!
        }
    }
    
    func setAppLanguage(_ languageCode: String) {
        setCurrentLanguage(languageCode)
        setCurrentBundlePath(languageCode)
    }
    
    private func setCurrentLanguage(_ languageCode: String) {
        currentLanguage = languageCode
        UserDefaults.standard.setValue(languageCode, forKey: "AppLanguage")
    }
    
    private func setCurrentBundlePath(_ languageCode: String) {
        guard let bundle = Bundle.main.path(forResource: languageCode, ofType: "lproj"),
              let langBundle = Bundle(path: bundle) else {
                  currentBundle = Bundle.main
                  return
              }
        currentBundle = langBundle
    }
}

