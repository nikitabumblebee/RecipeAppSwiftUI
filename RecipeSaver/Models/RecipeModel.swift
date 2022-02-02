//
//  RecipeModel.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 21.01.2022.
//

import Foundation
import SwiftUI

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

struct Recipe: Identifiable {
  let id = UUID()
  let name: String
  var image: String
  let description: String
  let ingredients: String
  let directions: String
  let category: Category.RawValue
  let datePublished: String
  let url: String
  var isFavorite: Bool = false
}

extension Recipe {
  static var all: [Recipe] = [
    Recipe(
      name: "Crispy Baked Polenta Sticks with Ranch Dip",
      image: "https://www.forksoverknives.com/wp-content/uploads/fly-images/141070/fancy-vegan-meatballs-appetizer-360x270-c.jpg",
      description: "Seasoned polenta sticks are rolled in bread crumbs and baked to crispy perfection for a deliciously dip-friendly snack. This recipe includes instructions for an easy homemade vegan Ranch Dip, but you can also substitute warmed marinara sauce to keep things easy. This recipe makes for a great Thanksgiving appetizer or a tasty midday treat to tide you over until dinner time.",
      ingredients: "2 cups unsweetened, unflavored plant-based milk\n1 cup dry polenta\n¼ cup nutritional yeast\n1 tablespoon flaxseed meal\n4½ teaspoons white wine vinegar\n1½ teaspoons lemon juice\n2 teaspoons garlic powder\n½ teaspoon sea salt\n¼ teaspoon freshly ground black pepper\n1 cup whole wheat bread crumbs\n1 12-oz. package soft silken tofu (or 1 15-oz. can cannellini beans, rinsed and drained)\n2 teaspoons onion powder\n2 teaspoons chopped fresh parsley (or ½ teaspoon dried parsley)\n2 teaspoons chopped fresh dill (or ½ teaspoon dried dill weed)\n2 teaspoons chopped fresh chives (or ½ teaspoon dried chives)",
      directions: "In a medium saucepan bring milk and 2 cups water to boiling. Gradually whisk in polenta. Reduce heat to low; cook 25 minutes or until thick and creamy, stirring frequently. Add in nutritional yeast, flaxseed meal, 3 teaspoons white wine vinegar, the lemon juice, ½ teaspoon garlic powder, ½ teaspoon sea salt, and ¼ teaspoon black pepper; mix well. Cook and stir 3 minutes more.\nOn a baking sheet spread polenta mixture into an 8×6-inch rectangle that is ½ inch thick. Let cool 5 minutes. Cover and chill for at least 1 and up to 12 hours.\nFor Ranch Dip, in a blender combine the tofu, onion powder, and the remaining 1½ teaspoons each garlic powder and vinegar. Cover and blend until smooth and creamy. Season with salt and pepper to taste, and pulse to combine. Transfer dip to a bowl and stir in parsley, dill, and chives. Chill 1 hour before serving.\nPreheat oven to 350°F. Slice chilled polenta in half lengthwise to make two long rectangles. Slice crosswise to divide each rectangle into 16 half-inch-thick sticks, for a total of 32 sticks.\nPlace bread crumbs in a shallow bowl. Dredge polenta sticks in crumbs until well coated. Arrange sticks on a baking sheet, spacing them at least ½ inch apart. Bake 20 minutes or until polenta sticks are crispy. Serve right away with Ranch Dip.",
      category: "Snack",
      datePublished: "2021-11-09",
      url: "https://www.forksoverknives.com/recipes/vegan-snacks-appetizers/crispy-baked-polenta-sticks-ranch-dip/",
      isFavorite: false
    ),
    Recipe(
      name: "Sun-Dried Tomato and Caramelized-Onion Focaccia",
      image: "https://www.forksoverknives.com/wp-content/uploads/fly-images/103976/focaccia-for-wordpress-360x270-c.jpg",
      description: "Focaccia is like a freestyle pizza. It’s perfect for parties because it can be served in any-size pieces (small squares to large slabs) and warm or at room temperature. Learn more about flatbreads and pizzas with our handy guide to plant-based pizza.",
      ingredients: "1 tablespoon date paste\n1 tablespoon active dry yeast\n1½ cups all-purpose flour\n½ cup potato flour\n½ cup white whole wheat flour\n½ cup cornmeal\n½ teaspoon sea salt\n2 cups thinly sliced onions\n½ cup thinly sliced sun-dried tomatoes (not oil-packed)\n⅓ cup pickled jalapeños, chopped (optional)\n⅓ cup chopped olives (optional)",
      directions: "IFor sponge, in a small bowl stir together ⅔ cup warm water and the date paste. Sprinkle in the yeast and ½ cup of the all-purpose flour; stir to combine. Cover bowl and let stand in a warm place 25 minutes.\nIn a separate bowl stir together potato flour and 1 cup water. Add the remaining 1 cup all-purpose flour, the whole wheat flour, cornmeal, salt, and ⅓ cup warm water. Add the sponge; mix well. Transfer dough to a floured work surface. Form dough into a ball and knead lightly 2 to 3 minutes or until soft and sticky.\nReturn dough to bowl; cover with a damp cloth. Let rise in a warm place 1 hour or until double in size.\nMeanwhile, in a medium saucepan cook onions with ¼ cup water over medium heat about 10 minutes or until starting to turn translucent, stirring frequently and adding water, 1 to 2 Tbsp. at a time, as needed to prevent sticking.\nSoak sun-dried tomatoes in ½ cup water 20 minutes or until soft; drain.\nPreheat oven to 475°F. Line a 13×9-inch baking pan with parchment paper.\nPunch down dough. On a lightly floured surface, roll dough into a ½-inch-thick rectangle. Transfer dough to the prepared baking pan. Top evenly with onions, tomatoes, and, if desired, jalapeños and olives.\nLet focaccia stand 15 minutes. Bake 30 minutes or until golden brown.",
      category: "Main",
      datePublished: "2020-01-07",
      url: "https://www.forksoverknives.com/recipes/vegan-baked-stuffed/sun-dried-tomato-and-caramelized-onion-focaccia/",
      isFavorite: false
    )
  ]
  
  static func resetFavorites() {
    Recipe.all.indices.forEach { Recipe.all[$0].isFavorite = false }
  }
  static func addRecipe(recipe: Recipe) {
    Recipe.all.append(recipe)
  }
}
