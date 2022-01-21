//
//  NewRecipeView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 21.01.2022.
//

import SwiftUI

struct NewRecipeView: View {
    var body: some View {
      NavigationView {
        Text("New Recipe")
          .navigationTitle("New Recipe")
      }
      .navigationViewStyle(.stack)
    }
}

struct NewRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeView()
    }
}
