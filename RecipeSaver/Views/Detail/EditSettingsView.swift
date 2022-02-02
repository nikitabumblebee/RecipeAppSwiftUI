//
//  EditSettingsView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 01.02.2022.
//

import SwiftUI

struct EditSettingsView: View {
  @Environment(\.presentationMode) var presentationMode
  
  @State private var isDarkModeOn = UserSettings.shared.isDarkModeOn
  @State private var showingImagePicker = false
  @State private var avatarImage = UserSettings.shared.image!
  @State private var name: String = UserSettings.shared.userName
  @State private var nickName: String = UserSettings.shared.userNickName
  @State private var navigateToSettingsView = false
  
  var body: some View {
    VStack(alignment: .leading) {
      ProfileImageView(avatarImage: $avatarImage, showingImagePicker: $showingImagePicker, isDarkModeOn: $isDarkModeOn)
        .padding(-5)
      TextField(UserSettings.shared.userName, text: $name)
      TextField(UserSettings.shared.userNickName, text: $nickName)
      Spacer()
    }
    .padding()
    .navigationBarBackButtonHidden(true)
    .navigationBarItems(
      leading: Button(action: { self.presentationMode.wrappedValue.dismiss() }) { Text("Cancel") },
      trailing: Button(action: { self.commitDataEntry() }) { Text("Save") })
    .onAppear(perform: loadStateVariables)
    .sheet(isPresented: $showingImagePicker) {
      PhotoPicker(image: self.$avatarImage)
    }
  }
}

extension EditSettingsView {
  func commitDataEntry() {
    UserSettings.shared.image = self.avatarImage
    UserSettings.shared.userName = self.name
    UserSettings.shared.userNickName = self.nickName
    self.presentationMode.wrappedValue.dismiss()
  }
  
  func loadStateVariables() {
    avatarImage = UserSettings.shared.image!
    isDarkModeOn = UserSettings.shared.isDarkModeOn
    name = UserSettings.shared.userName
    nickName = UserSettings.shared.userNickName
  }
}

struct EditSettingsView_Previews: PreviewProvider {
  static var previews: some View {
    EditSettingsView()
  }
}
