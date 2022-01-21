//
//  CategoriesView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 21.01.2022.
//

import SwiftUI

struct CategoriesView: View {
    var body: some View {
      NavigationView {
        Text("Categories")
          .navigationTitle("Categories")
      }
      .navigationViewStyle(.stack)
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
