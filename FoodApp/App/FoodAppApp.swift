//
//  FoodAppApp.swift
//  FoodApp
//
//  Created by A'zamjon Abdumuxtorov on 24/07/24.
//

import SwiftUI

@main
struct FoodAppApp: App {
    @StateObject var vm: HomeViewModel = HomeViewModel()
    @StateObject var saved: SavedFoodViewModel = SavedFoodViewModel()
    
    init(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.black
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(vm)
                .environmentObject(saved)
        }
    }
}
