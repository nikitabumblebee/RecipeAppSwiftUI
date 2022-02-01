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
        Text("User Info")
          .font(.system(size: 25))
          .font(.headline)
        
        ProfileImageView(avatarImage: $avatarImage, showingImagePicker: $showingImagePicker, isDarkModeOn: $isDarkModeOn)
        
        HStack {
          Text("Name: \(settingsVM.userName)")
          
          Spacer()
          
          Button {
            isAlertShow = true
          } label: {
            Text("Edit")
          }
          .alert(isPresented: $isAlertShow, TextAlert(title: "Edit name", message: "Enter your name") { result in
            if result != nil {
              settingsVM.updateUserName(name: result!)
            }
          })
          .frame(width: 40)
        }
        .frame(height: 30)
        
        Divider()
        
        Text("Preferences")
          .font(.system(size: 25))
          .font(.headline)
        
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

extension View {
  public func alert(isPresented: Binding<Bool>, _ alert: TextAlert) -> some View {
    AlertWrapper(isPresented: isPresented, alert: alert, content: self)
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView(settingsVM: SettingsViewModel())
  }
}
