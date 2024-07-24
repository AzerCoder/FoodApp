//
//  HomeViewModel.swift
//  FoodApp
//
//  Created by A'zamjon Abdumuxtorov on 24/07/24.
//

import Foundation
import Combine

class HomeViewModel:ObservableObject{
    @Published var foods:[Meal] = []
    @Published var category:[Category] = []
    @Published var searchText:String = ""
    @Published var isLoading = false
    
    private let foodDataService = FoodDataService()
    private let categoryDataService = CategoryDataService()
    private var cencellables = Set<AnyCancellable>()
    
    init(){
        
        addSubscribers()
    }
    
    func addSubscribers(){
        isLoading = true
        $searchText
            .combineLatest(foodDataService.$foods)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterFoods)
            .sink { [weak self] (returned)in
                self?.foods = returned
            }
            .store(in: &cencellables)
        
        categoryDataService.$category
            .sink {[weak self] (returned) in
                self?.category = returned
            }
            .store(in: &cencellables)
        DispatchQueue.main.asyncAfter(deadline: .now()+1){
            self.isLoading = false
        }
        
    }
    
    private func filterFoods(text:String,foods:[Meal]) -> [Meal]{
        guard !text.isEmpty else{
            return foods
        }
        
        let lowercasedText = text.lowercased()
        
        return foods.filter { food in
            return food.meal.lowercased().contains(lowercasedText) ||
                     food.id.lowercased().contains(lowercasedText)
             }
        
       
    }
}

