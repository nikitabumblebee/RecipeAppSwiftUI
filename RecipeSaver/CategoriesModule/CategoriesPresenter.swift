//
//  CategoriesPresenter.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 09.02.2022.
//

import SwiftUI

class CategoriesPresenter: ObservableObject {
    private let router = CategoriesRouter()
    
    func selectCategory(category: Category) -> some View {
        return NavigationLink(destination: router.selectCategory(category: category)) {
            Text(category.rawValue + "s")
        }
    }
}
