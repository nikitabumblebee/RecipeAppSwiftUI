//
//  SettingsView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 21.01.2022.
//

import SwiftUI

struct SettingsView: View {
  @ObservedObject var settingsVM: SettingsViewModel
  
  @State private var image = UIImage()
  
  @AppStorage("isDarkMode") private var isDarkMode = false
  
  @State var isAlertShow = false
  
  @State var isDarkModeOn = false
  
  @State private var showingImagePicker = false
  @State private var avatarImage = UIImage(systemName: "person.fill")!
  
  var body: some View {
    NavigationView {
      VStack(alignment: .leading) {
        HStack {
          Spacer()
          
          Button() {
            showingImagePicker = true
          } label: {
            Image(uiImage: avatarImage)
              .resizable()
              .scaledToFill()
              .padding(avatarImage == UIImage(systemName: "person.fill") ? 30 : 0)
              .frame(width: 120, height: 120)
              .background(Color(red: 0.9, green: 0.9, blue: 0.9))
              .foregroundColor(isDarkModeOn ? Color.white : Color.black)
              .clipShape(Circle())
              .clipped()
              .overlay(Circle().stroke(isDarkModeOn ? Color.white : Color.black, lineWidth: 4))
              .padding()
          }
          
          Spacer()
        }
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
