//
//  CategoryDataService.swift
//  FoodApp
//
//  Created by A'zamjon Abdumuxtorov on 24/07/24.
//

import Foundation
import Combine

class CategoryDataService{
    @Published var category: [Category] = []
    
    var categorySubsription: AnyCancellable?
    
    init(){
        getCategory()
    }
    
    private func getCategory(){
        
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php") else {return}
        
        categorySubsription = NetworkingManager.download(url: url)
            .decode(type: CategoryModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleComplition, receiveValue: {[weak self] (returned) in
                self?.category = returned.categories
                self?.categorySubsription?.cancel()
            })
           
           
    }
}
