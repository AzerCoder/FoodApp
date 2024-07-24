//
//  SavedFoodViewModel.swift
//  FoodApp
//
//  Created by A'zamjon Abdumuxtorov on 24/07/24.
//

import Foundation
import Combine

class SavedFoodViewModel:ObservableObject{
    
    @Published var foods: [Meal] = []
    @Published var searchText: String = ""
    
    private let fileName = "foods.json"
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        load()
        addSubscribers()
    }
    
    private func addSubscribers() {
        $searchText
            .combineLatest($foods)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterFoods)
            .sink { [weak self] filteredFoods in
                self?.foods = filteredFoods
            }
            .store(in: &cancellables)
    }
    
    private func filterFoods(searchText: String, foods: [Meal]) -> [Meal] {
        guard !searchText.isEmpty else {
            return foods
        }
        
        let lowercasedText = searchText.lowercased()
        
        return foods.filter { food in
            food.meal.lowercased().contains(lowercasedText) ||
            food.id.lowercased().contains(lowercasedText)
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func load() {
        let fileURL = getDocumentsDirectory().appendingPathComponent(fileName)
        
        guard let data = try? Data(contentsOf: fileURL) else { return }
        if let decodedFoods = try? JSONDecoder().decode([Meal].self, from: data) {
            self.foods = decodedFoods
        }
    }
    
    func save() {
        let fileURL = getDocumentsDirectory().appendingPathComponent(fileName)
        
        if let encodedFoods = try? JSONEncoder().encode(foods) {
            try? encodedFoods.write(to: fileURL, options: [.atomic, .completeFileProtection])
        }
    }
    
    func add(_ food: Meal) {
        foods.append(food)
        save()
    }
    
    func remove(withId id: String) {
        foods.removeAll { $0.id == id }
        save()
    }
    
    func isSaved(id: String) -> Bool {
        return foods.contains { $0.id == id }
    }
}
