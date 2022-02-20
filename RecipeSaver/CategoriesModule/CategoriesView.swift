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
            ZStack {
                VStack {
                    NavigationHeaderView()
                    Spacer()
                }
                List {
                    ForEach(Category.allCases) { category in
                        presenter.selectCategory(category: category)
                    }
                }
                .padding(.top, 1)
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
