//
//  EditSettingsPresenter.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 07.02.2022.
//

import SwiftUI
import Combine

class EditSettingsPresenter: ObservableObject {
  private let interactor: EditSettingsInteractor
  
  @Published var name: String
  @Published var nickName: String
  @Published var isDarkModeOn: Bool
  
  init(interactor: EditSettingsInteractor) {
    self.name = UserSettings.shared.userName
    self.nickName = UserSettings.shared.userNickName
    self.isDarkModeOn = UserSettings.shared.isDarkModeOn
    self.interactor = interactor
  }
  
  func updateSettings(avatarImage: UIImage) {
    let imageLoader = ImageLoader()
    imageLoader.saveImage(imageName: "userImage", image: avatarImage)
    UserSettings.shared.image = avatarImage
    interactor.updateSetting(name: name, nickName: nickName, isDarkModeOn: isDarkModeOn)
  }
}
