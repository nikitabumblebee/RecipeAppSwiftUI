//
//  UserRecipe.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 10.02.2022.
//

import Foundation

class UserRecipe: Recipe {
    
    @Published var isUserRecipe: Bool
    
    init(name: String, image: String, description: String, ingredients: String, directions: String, category: String, datePublished: String, url: String, cookTime: String, isFavorite: Bool = false, isUserRecipe: Bool) {
        self.isUserRecipe = isUserRecipe
        super.init(name: name, image: image, description: description, ingredients: ingredients, directions: directions, category: category, datePublished: datePublished, url: url, cookTime: cookTime, isFavorite: isFavorite)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        isUserRecipe = try container.decode(Bool.self, forKey: .isUserRecipe)
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
}

