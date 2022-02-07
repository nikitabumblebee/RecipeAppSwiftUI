//
//  EditSettingsView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 01.02.2022.
//

import SwiftUI

struct EditSettingsView: View {
  @Environment(\.presentationMode) var presentationMode
  
  @ObservedObject var presenter: EditSettingsPresenter
  @State private var avatarImage: UIImage = UserSettings.shared.image!
  @State private var showingImagePicker = false
  @State private var isEditMode = true
  
  var body: some View {
    VStack(alignment: .leading) {
      ProfileImageView(avatarImage: $avatarImage, isDarkModeOn: $presenter.isDarkModeOn, isShowingImagePicker: $showingImagePicker, isEditMode: $isEditMode)
        .padding(-5)
      TextField(presenter.name, text: $presenter.name)
      TextField(presenter.nickName, text: $presenter.nickName)
      Spacer()
    }
    .padding()
    .navigationBarBackButtonHidden(true)
    .navigationBarItems(
      leading: Button(action: { self.presentationMode.wrappedValue.dismiss() }) { Text("Cancel") },
      trailing: Button(action: {
        self.presenter.updateSettings(avatarImage: avatarImage)
        self.presentationMode.wrappedValue.dismiss()
      }) { Text("Save") })
    .onAppear {
      let imageLoader = ImageLoader()
      self.avatarImage = imageLoader.loadImageFromDiskWith(fileName: "userImage")!
    }
    .sheet(isPresented: $showingImagePicker) {
      PhotoPicker(image: self.$avatarImage)
    }
  }
}

struct EditSettingsView_Previews: PreviewProvider {
  static var previews: some View {
    EditSettingsView(presenter: EditSettingsPresenter(interactor: EditSettingsInteractor()))
  }
}
