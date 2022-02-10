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
    @State private var isDarkModeOn = (UserDefaults.standard.integer(forKey: "selectedAppearance") == 2) ? true : false
    @State private var isShowingImagePicker = false
    @State private var avatarImage = UserSettings.shared.image!
    @State private var userName = UserSettings.shared.userName
    @State private var userNickName = UserSettings.shared.userNickName
    @State private var isEditMode = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    NavigationHeaderView()
//                    presenter.routeToEditSettingsView()
//                        .padding(.trailing)
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
                                HStack {
                                    Image(systemName: "paintpalette")
                                        .foregroundColor(Color.green)
                                    Text("Dark Mode")
                                }
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
            }
            .toolbar {
                presenter.routeToEditSettingsView()
                    .padding(.trailing)
            }
            .navigationTitle("Settings")
            .onAppear {
                let imageLoader = ImageLoader()
                if imageLoader.loadImageFromDiskWith(fileName: "userImage") == nil {
                    self.avatarImage = UIImage(systemName: "person.fill")!
                } else {
                    self.avatarImage = imageLoader.loadImageFromDiskWith(fileName: "userImage")!
                }
                self.userName = UserSettings.shared.userName
                self.userNickName = UserSettings.shared.userNickName
            }
            
        }
        .navigationViewStyle(.stack)
    }
}

extension View {
    public func alert(isPresented: Binding<Bool>, _ alert: TextAlert) -> some View {
        AlertWrapper(isPresented: isPresented, alert: alert, content: self)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(presenter: SettingsPresenter(interactor: SettingsInteractor(model: DataModel.sample)))
    }
}
