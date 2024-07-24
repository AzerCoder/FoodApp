//
//  CategoryModel.swift
//  FoodApp
//
//  Created by A'zamjon Abdumuxtorov on 24/07/24.
//

import Foundation

struct CategoryModel: Codable {
    let categories: [Category]
}


struct Category: Codable {
    let id, category: String
    let categoryThumb: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case category = "strCategory"
        case categoryThumb = "strCategoryThumb"
        case description = "strCategoryDescription"
    }
}
