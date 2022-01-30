//
//  SettingsView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 21.01.2022.
//

import SwiftUI

struct SettingsView: View {
  @ObservedObject var settingsVM: SettingsViewModel
  
  @AppStorage("isDarkMode") private var isDarkMode = false
  
  @State var isAlertShow = false
  
  @State var isDarkModeOn = false
  
  var body: some View {
    NavigationView {
      VStack(alignment: .leading) {
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
            Button {
              
            } label: {
              Text("Cancel")
            }
          }
          .foregroundColor(Color.red)
          
          Spacer()
        }
      }
      .padding()
      .navigationTitle("Settings")
    }
    .navigationViewStyle(.stack)
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView(settingsVM: SettingsViewModel())
  }
}
