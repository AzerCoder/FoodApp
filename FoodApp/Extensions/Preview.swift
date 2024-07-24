//
//  Preview.swift
//  FoodApp
//
//  Created by A'zamjon Abdumuxtorov on 24/07/24.
//

import SwiftUI

extension Preview{
    
    static var dev: DeveloperPreview{
        return DeveloperPreview.instance
    }
}

class DeveloperPreview{
    
    static let instance  = DeveloperPreview()
    private init() {}
    
    let food = Meal(
        id: "52771",
        meal: "Spicy Arrabiata Penne",
        drinkAlternate: nil,
        category: "Vegetarian",
        area: "Italian",
        instructions: """
        Bring a large pot of water to a boil. Add kosher salt to the boiling water, then add the pasta.
        Cook according to the package instructions, about 9 minutes.
        In a large skillet over medium-high heat, add the olive oil and heat until the oil starts to shimmer.
        Add the garlic and cook, stirring, until fragrant, 1 to 2 minutes. Add the chopped tomatoes, red chile flakes,
        Italian seasoning and salt and pepper to taste. Bring to a boil and cook for 5 minutes. Remove from the heat and add the chopped basil.
        Drain the pasta and add it to the sauce. Garnish with Parmigiano-Reggiano flakes and more basil and serve warm.
        """,
        mealThumb: "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg",
        tags: "Pasta,Curry",
        youtube: "https://www.youtube.com/watch?v=1IszT_guI08",
        ingredient1: "penne rigate",
        ingredient2: "olive oil",
        ingredient3: "garlic",
        ingredient4: "chopped tomatoes",
        ingredient5: "red chilli flakes",
        ingredient6: "italian seasoning",
        ingredient7: "basil",
        ingredient8: "Parmigiano-Reggiano",
        ingredient9: "",
        ingredient10: "",
        measure1: "1 pound",
        measure2: "1/4 cup",
        measure3: "3 cloves",
        measure4: "1 tin",
        measure5: "1/2 teaspoon",
        measure6: "1/2 teaspoon",
        measure7: "6 leaves",
        measure8: "spinkling",
        measure9: "",
        measure10: "",
        source: nil,
        imageSource: nil,
        creativeCommonsConfirmed: nil,
        dateModified: nil
    )

    let category = Category(
        id: "1",
        category: "Beef",
        categoryThumb: "https://www.themealdb.com/images/category/beef.png",
        description: "Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.[2]"
    )
}

