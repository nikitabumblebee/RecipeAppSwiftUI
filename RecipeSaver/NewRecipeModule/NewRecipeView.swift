//
//  NewRecipeView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 21.01.2022.
//

import SwiftUI

struct NewRecipeView: View {
    @ObservedObject var presenter: NewRecipePresenter
    @EnvironmentObject var model: DataModel
    
    var body: some View {
        NavigationView {
            ZStack {
                //ApplicationBackgroundColor()
                VStack {
                    NavigationHeaderView()
                    Spacer()
                }
                presenter.makeNewRecipe()
                    .navigationTitle("New Recipe")
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct NewRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeView(presenter: NewRecipePresenter(interactor: NewRecipeInteractor(model: DataModel.sample)))
    }
}
