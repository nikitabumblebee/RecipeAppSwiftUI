//
//  EditSettingsInteractor.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 07.02.2022.
//

import Foundation

class EditSettingsInteractor {
    let userSettings: UserSettings
    
    init() {
        self.userSettings = UserSettings.shared
    }
    
    func updateSetting(name: String, nickName: String, isDarkModeOn: Bool) {
        userSettings.userName = name
        userSettings.userNickName = nickName
        userSettings.isDarkModeOn = isDarkModeOn
    }
}
