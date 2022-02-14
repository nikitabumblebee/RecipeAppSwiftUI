//
//  CategoriesView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 21.01.2022.
//

import SwiftUI

struct CategoriesView: View {
    @ObservedObject var presenter: CategoriesPresenter
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationHeaderView()
                List {
                    ForEach(Category.allCases) { category in
                        presenter.selectCategory(category: category)
                    }
                }
                .padding(.top, -7.5)
                .navigationTitle("Categories")
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(presenter: CategoriesPresenter())
    }
}
