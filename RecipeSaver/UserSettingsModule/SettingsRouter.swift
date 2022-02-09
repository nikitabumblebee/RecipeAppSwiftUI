//
//  SettingsRouter.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 04.02.2022.
//

import SwiftUI

class SettingsRouter {
    func editProfile() -> some View {
        return EditSettingsView(presenter: EditSettingsPresenter(interactor: EditSettingsInteractor()))
    }
}
