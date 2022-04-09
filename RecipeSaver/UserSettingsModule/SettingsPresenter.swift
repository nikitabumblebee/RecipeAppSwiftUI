//
//  SettingsPresenter.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 04.02.2022.
//

import SwiftUI

class SettingsPresenter: ObservableObject {
    private let interactor: SettingsInteractor
    private let router: SettingsRouter
    
    @State var userSettings = UserSettings.shared
    @State var avatarImage: UIImage
    
    init(interactor: SettingsInteractor) {
        self.interactor = interactor
        self.router = SettingsRouter()
        let imageLoader = ImageLoader()
        if imageLoader.loadImageFromDiskWith(fileName: "userImage") == nil {
            self.avatarImage = UIImage(systemName: "person.fill")!
        } else {
            self.avatarImage = imageLoader.loadImageFromDiskWith(fileName: "userImage")!
        }
    }
    
    func resetFavorites() {
        interactor.resetFavorites()
    }
    
    func routeToEditSettingsView() -> some View {
        let destination = router.editProfile()
        return NavigationLink(destination: destination) {
            Text("Edit")
        }
    }
    
    func routeToAppearanceView() -> some View {
        let destination = router.routeToAppearanceView()
        return NavigationLink(destination: destination) {
            HStack {
                Image(systemName: "paintpalette")
                    .foregroundColor(Color.green)
                Text("Appearance")
            }
        }
    }
}
