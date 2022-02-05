//
//  ContentView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 21.01.2022.
//

import SwiftUI

struct ContentView: View {
  var model = DataModel()
  var body: some View {
    model.load()
    return TabBar()
      .environmentObject(model)
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
