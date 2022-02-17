//
//  HomePresenter.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 09.02.2022.
//

import SwiftUI
import Combine
import SwiftSoup

class HomePresenter: ObservableObject {
    private let interactor: RecipeListInteractor
    private var cancallables = Set<AnyCancellable>()
    private let router: RecipeListRouter
    
    @Published private(set) var recipes: [Recipe] = []
    
    init(interactor: RecipeListInteractor) {
        self.interactor = interactor
        self.router = RecipeListRouter()
        
        interactor.$recipes
            .map { array in
                array.filter { $0.recipeType == RecipeType.new.rawValue }
            }
            .assign(to: \.recipes, on: self)
            .store(in: &cancallables)
    }
    
    func routeToRecipe(recipe: Recipe) -> some View {
        let destination = router.moveToRecipe(recipe: recipe, model: interactor.model)
        return NavigationLink(destination: destination) {
            RecipeCardView(presenter: RecipeCardPresenter(interactor: RecipeCardInteractor(model: interactor.model, recipe: recipe)))
        }
    }
    
    func makeRecipeSearchNavigation(recipe: Recipe, model: DataModel) -> some View {
        return NavigationLink(destination: RecipeDescriptionView(presenter: RecipeDescriptionPresenter(interactor: RecipeDescriptionInteractor(model: model), recipe: recipe))) {
            Text(recipe.name)
        }
    }
    
    func filterRecipes(searchQuery: String, model: DataModel) -> [Recipe] {
        if searchQuery.isEmpty {
            return model.recipes
        } else {
            return model.recipes.filter {
                $0.name.localizedCaseInsensitiveContains(searchQuery)
            }
        }
    }
    
    func parse() throws -> String {
        do {
            let content = try String(contentsOf: URL(string: "https://www.forksoverknives.com/recipes/?type=grid")!)
            let doc: Document = try SwiftSoup.parse(content)
            let link: Element = try doc.select("a").first()!
            let body: Element? = doc.body()
            let linkHref: String = try link.attr("href")
            print("!!!! \(linkHref)")
            guard let body = try body?.text() else {
                return ""
            }
            return body//doc.text()
        } catch Exception.Error(let type, let message) {
            print(message)
        } catch {
            print("error")
        }
//
        
        return ""
    }
    
    var siteContent: String {
        get {
            return try! parse()
        }
    }
}
