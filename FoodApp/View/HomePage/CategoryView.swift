//
//  CategoryView.swift
//  FoodApp
//
//  Created by A'zamjon Abdumuxtorov on 25/07/24.
//

import SwiftUI

struct CategoryView: View {
    @Environment(\.dismiss) var dissmis
    @EnvironmentObject var vm:HomeViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [Utills.black,Utills.black.opacity(0.8)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            ScrollView(showsIndicators:false) {
                VStack{
                    HStack{}.frame(height: 10)
                    LazyVGrid(columns: columns, spacing: 30) {
                        ForEach(vm.category, id: \.id) { category in
                            CategoryCell(category: category)
                        }
                    }
                }
            }.padding()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: Button(action: {
                dissmis()
            }, label: {
                Image(systemName: "arrow.left")
                    .bold().font(.title2)
                    .foregroundColor(Utills.orange)
            })
        )
        .navigationBarTitle(Text("Categories"),displayMode: .inline)
    }
}

#Preview {
    NavigationView {
        CategoryView()
            .environmentObject(HomeViewModel())
    }
}
