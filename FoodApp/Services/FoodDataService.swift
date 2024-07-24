//
//  FoodDataService.swift
//  FoodApp
//
//  Created by A'zamjon Abdumuxtorov on 24/07/24.
//

import Foundation
import Combine

class FoodDataService{
    @Published var foods: [Meal] = []
    
    var foodSubsription: AnyCancellable?
    
    init(){
        getFoods()
    }
    
    private func getFoods(){
        
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?f=a") else {return}
        
        foodSubsription = NetworkingManager.download(url: url)
            .decode(type: FoodModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleComplition, receiveValue: {[weak self] (returned) in
                self?.foods = returned.meals
                self?.foodSubsription?.cancel()
            })
           
           
    }
}

