//
//  SettingsView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 21.01.2022.
//

import SwiftUI

struct SettingsView: View {
  @ObservedObject var presenter: SettingsPresenter
  
  @State private var isAlertShow = false
  @State private var isDarkModeOn = UserSettings.shared.isDarkModeOn
  @State private var isShowingImagePicker = false
  @State private var avatarImage = UserSettings.shared.image!
  @State private var userName = UserSettings.shared.userName
  @State private var userNickName = UserSettings.shared.userNickName
  @State private var isEditMode = false
  
  var body: some View {
    NavigationView {
      VStack {
        presenter.routeToEditSettingsView()
          .padding(.trailing)
        ProfileImageView(avatarImage: $avatarImage, isDarkModeOn: $isDarkModeOn, isShowingImagePicker: $isShowingImagePicker, isEditMode: $isEditMode)
          .padding(-5)
        HStack {
          Spacer()
          Text(userName)
            .font(.system(size: 25))
          Spacer()
        }
        HStack {
          Spacer()
          Text(userNickName)
          Spacer()
        }
        Form {
          Section {
            Toggle(isOn: $isDarkModeOn) {
              Text("Dark Mode")
            }
            .onChange(of: isDarkModeOn) { value in
              presenter.switchDarkMode(isDarkModeEnabled: value)
            }
          }
          
          HStack {
            Spacer()
            Button {
              isAlertShow = true
            } label: {
              Text("Reset Favorites")
            }
            .alert("Reset all favorites?", isPresented: $isAlertShow) {
              Button {
                presenter.resetFavorites()
              } label: {
                Text("Reset")
              }
              Button("Cancel", action: {})
            }
            .foregroundColor(Color.red)
            Spacer()
          }
        }
      }
      .navigationTitle("Settings")
      .onAppear {
        let imageLoader = ImageLoader()
        self.avatarImage = imageLoader.loadImageFromDiskWith(fileName: "userImage")!
        self.userName = UserSettings.shared.userName
        self.userNickName = UserSettings.shared.userNickName
      }
    }
    .navigationViewStyle(.stack)
    .preferredColorScheme(isDarkModeOn ? .dark : .light)
  }
}

extension View {
  public func alert(isPresented: Binding<Bool>, _ alert: TextAlert) -> some View {
    AlertWrapper(isPresented: isPresented, alert: alert, content: self)
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView(presenter: SettingsPresenter(interactor: SettingsInteractor()))
  }
}
