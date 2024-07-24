//
//  FavouriteView.swift
//  FoodApp
//
//  Created by A'zamjon Abdumuxtorov on 24/07/24.
//

import SwiftUI

struct FavouriteView: View {
    @Binding var isShow:Bool
    @EnvironmentObject var vm:SavedFoodViewModel
    var body: some View {
        NavigationView{
            ZStack {
                LinearGradient(colors: [Utills.black,Utills.black.opacity(0.8)], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                ScrollView{
                    VStack{
                        SearchBarView(searchText: $vm.searchText)
                            .padding(.bottom)
                        ForEach(vm.foods,id: \.id){food in
                            FoodCell(viewMadel: vm, food: food)
                        }
                    }.padding()
                    
                }
                .navigationBarItems(
                    leading: Button(action: {
                        isShow.toggle()
                    }, label: {
                        Image(systemName: "arrow.left")
                            .bold().font(.title2)
                            .foregroundColor(Utills.orange)
                    })
                    ,
                    trailing:  Text("Favourite")
                        .bold().font(.title)
                        .foregroundColor(.white)
                   
            )
            }
        }
    }
}

#Preview {
    FavouriteView(isShow: .constant(false))
        .environmentObject(SavedFoodViewModel())
}
