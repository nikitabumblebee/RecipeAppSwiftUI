//
//  AppearanceView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 18.02.2022.
//

import SwiftUI

struct AppearanceView: View {
    @ObservedObject var presenter: AppearancePresenter
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isDarkModeOn = (UserDefaults.standard.integer(forKey: "selectedAppearance") == 2) ? true : false
    
    var body: some View {
        VStack {
            RadialGradient(colors: [.green.opacity(0.3), .blue.opacity(0.2)], center: .bottomTrailing, startRadius: 0, endRadius: 300)
                .ignoresSafeArea()
                .frame(height: 10)
            Form {
                Section {
                    Toggle(isOn: $isDarkModeOn) {
                        HStack {
                            Text("Dark Mode")
                        }
                    }
                    .onChange(of: isDarkModeOn) { value in
                        presenter.switchDarkMode(isDarkModeEnabled: value)
                    }
                }
            }
            .padding(.top, -7.0)
            .navigationBarTitle("Appearance", displayMode: .inline)
        }
    }
}

struct AppearanceView_Previews: PreviewProvider {
    static var previews: some View {
        AppearanceView(presenter: AppearancePresenter(interactor: AppearanceInteractor()))
    }
}
