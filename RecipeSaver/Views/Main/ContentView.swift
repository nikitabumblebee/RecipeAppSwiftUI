//
//  ContentView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 21.01.2022.
//

import SwiftUI

struct ContentView: View {
    var model = DataModel()
    var utilities = UserAppearance()
    
    @AppStorage("selectedAppearance") var selectedAppearance = UserDefaults.standard.integer(forKey: "selectedAppearance")
    
    var body: some View {
        model.load()
        return TabBarView()
            .environmentObject(model)
            .onAppear {
                utilities.overrideDisplayMode()
            }
            .onChange(of: selectedAppearance, perform: { value in
                utilities.overrideDisplayMode()
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let model = DataModel.sample
        ContentView()
            .environmentObject(model)
            .preferredColorScheme(UserSettings.shared.isDarkModeOn ? .dark : .light)
    }
}
