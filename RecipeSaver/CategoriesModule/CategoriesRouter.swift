//
//  CategoriesRouter.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 09.02.2022.
//

import SwiftUI

class CategoriesRouter {
    func selectCategory(category: Category) -> some View {
        return CategoryView(category: category)
    }
}
