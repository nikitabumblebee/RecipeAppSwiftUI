//
//  SettingsView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 21.01.2022.
//

import SwiftUI

struct SettingsView: View {
  @ObservedObject var settingsVM: SettingsViewModel
      
  @State private var isAlertShow = false
  @State private var isDarkModeOn = UserSettings.shared.isDarkModeOn
  @State private var showingImagePicker = false
  @State private var avatarImage = UserSettings.shared.image!
  
  var body: some View {
    NavigationView {
      VStack(alignment: .leading) {
        ProfileImageView(avatarImage: $avatarImage, showingImagePicker: $showingImagePicker, isDarkModeOn: $isDarkModeOn)
          .padding(.bottom, 20.0)
        
        Divider()
        
        Toggle(isOn: $isDarkModeOn) {
          Text("Dark Mode")
        }
        .onChange(of: isDarkModeOn) { value in
          if value == true {
            settingsVM.turnOffDarkMode()
          } else {
            settingsVM.turnOnDarkMode()
          }
        }
        .preferredColorScheme(isDarkModeOn ? .dark : .light)
        
        Spacer()
        
        HStack {
          Spacer()
          
          Button {
            isAlertShow = true
          } label: {
            Text("Reset Favorites")
          }
          .alert("Reset all favorites?", isPresented: $isAlertShow) {
            Button {
              settingsVM.resetFavorites()
            } label: {
              Text("Reset")
            }
            Button("Cancel", action: {})
          }
          .foregroundColor(Color.red)
          
          Spacer()
        }
      }
      .padding()
      .navigationTitle("Settings")
    }
    .navigationViewStyle(.stack)
    .sheet(isPresented: $showingImagePicker) {
      PhotoPicker(image: self.$avatarImage)
    }
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView(settingsVM: SettingsViewModel())
  }
}
