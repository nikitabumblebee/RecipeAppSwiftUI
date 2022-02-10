//
//  Recipe.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 05.02.2022.
//

import Foundation
import Combine

class Recipe {
    @Published var name: String
    @Published var image: String
    @Published var description: String
    @Published var ingredients: String
    @Published var directions: String
    @Published var category: Category.RawValue
    @Published var datePublished: String
    @Published var url: String
    @Published var isFavorite: Bool
    @Published var cookTime: String
    let id: UUID
    
    init(name: String, image: String, description: String, ingredients: String, directions: String, category: String, datePublished: String, url: String, cookTime: String, isFavorite: Bool = false) {
        id = UUID()
        self.name = name
        self.image = image
        self.description = description
        self.ingredients = ingredients
        self.directions = directions
        self.category = category
        self.datePublished = datePublished
        self.url = url
        self.cookTime = cookTime
        self.isFavorite = isFavorite
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        image = try container.decode(String.self, forKey: .image)
        description = try container.decode(String.self, forKey: .description)
        ingredients = try container.decode(String.self, forKey: .ingredients)
        directions = try container.decode(String.self, forKey: .directions)
        category = try container.decode(String.self, forKey: .category)
        datePublished = try container.decode(String.self, forKey: .datePublished)
        url = try container.decode(String.self, forKey: .url)
        cookTime = try container.decode(String.self, forKey: .cookTime)
        isFavorite = try container.decode(Bool.self, forKey: .isFavorite)
        id = try container.decode(UUID.self, forKey: .id)
    }
}

extension Recipe: Codable {
    enum CodingKeys: CodingKey {
        case name
        case image
        case description
        case ingredients
        case directions
        case category
        case datePublished
        case url
        case cookTime
        case isFavorite
        case isUserRecipe
        case id
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(image, forKey: .image)
        try container.encode(description, forKey: .description)
        try container.encode(ingredients, forKey: .ingredients)
        try container.encode(directions, forKey: .directions)
        try container.encode(category, forKey: .category)
        try container.encode(datePublished, forKey: .datePublished)
        try container.encode(url, forKey: .url)
        try container.encode(cookTime, forKey: .cookTime)
        try container.encode(isFavorite, forKey: .isFavorite)
        //try container.encode(isUserRecipe, forKey: .isUserRecipe)
        try container.encode(id, forKey: .id)
    }
}

extension Recipe: Identifiable { }

extension Recipe: ObservableObject { }

enum Category: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    case breakfast = "Breakfast"
    case soup = "Soup"
    case salad = "Salad"
    case appetizer = "Appetizer"
    case main = "Main"
    case side = "Side"
    case dessert = "Dessert"
    case snack = "Snack"
    case drink = "Drink"
}
