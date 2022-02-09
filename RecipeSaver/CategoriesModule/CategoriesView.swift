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
                //ApplicationBackgroundColor()
                VStack {
                    NavigationHeaderView()
                    List {
                        ForEach(Category.allCases) { category in
                            presenter.selectCategory(category: category)
                                //.listRowBackground(Color.gray.opacity(0.2))
                        }
                    }
                    .padding(.top, -7.5)
                    .onAppear {
                        //UITableView.appearance().backgroundColor = .clear
                    }
                    .navigationTitle("Categories")
                }
                
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
