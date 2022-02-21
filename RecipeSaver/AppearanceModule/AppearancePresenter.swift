//
//  AppearancePresenter.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 18.02.2022.
//

import SwiftUI

class AppearancePresenter: ObservableObject {
    private let interactor: AppearanceInteractor
    
    init(interactor: AppearanceInteractor) {
        self.interactor = interactor
    }
    
    func switchDarkMode(isDarkModeEnabled: Bool) {
        if isDarkModeEnabled {
            interactor.turnOnDarkMode()
        } else {
            interactor.turnOffDarkMode()
        }
    }
}
