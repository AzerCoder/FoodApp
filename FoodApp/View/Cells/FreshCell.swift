//
//  FreshCell.swift
//  FoodApp
//
//  Created by A'zamjon Abdumuxtorov on 24/07/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct FreshCell: View {
    @StateObject var viewMadel = SavedFoodViewModel()
    @State var isChecked:Bool = false
    @State var showDetail = false
    let food : Meal
    var body: some View {
        
        VStack(alignment:.leading){
            HStack(alignment:.top){
                Button {
                    if  !isChecked{
                        let food = Meal(id: food.id, meal: food.meal, drinkAlternate: food.drinkAlternate, category: food.category, area: food.area, instructions: food.instructions, mealThumb: food.mealThumb, tags: food.tags, youtube: food.youtube, ingredient1: food.ingredient1, ingredient2: food.ingredient2, ingredient3: food.ingredient3, ingredient4: food.ingredient4, ingredient5: food.ingredient5, ingredient6: food.ingredient6, ingredient7: food.ingredient7, ingredient8: food.ingredient8, ingredient9: food.ingredient9, ingredient10: food.ingredient10, measure1: food.measure1, measure2: food.measure2, measure3: food.measure3, measure4: food.measure4, measure5: food.measure5, measure6: food.measure6, measure7: food.measure7, measure8: food.measure8, measure9: food.measure9, measure10: food.measure10, source: food.source, imageSource: food.imageSource, creativeCommonsConfirmed: food.creativeCommonsConfirmed, dateModified: food.dateModified,isChecked: true)
                        viewMadel.add(food)
                    }else{
                        viewMadel.remove(withId: food.id)
                    }
                    isChecked.toggle()
                } label: {
                    Image(systemName: isChecked ? "heart.fill":"heart")
                        .font(.title)
                        .foregroundColor(Utills.orange)
                }
                Spacer()
                WebImage(url: URL(string: food.mealThumb))
                    .resizable()
                    .frame(width: 80,height: 80)
                    .cornerRadius(20)
            }
            
            Text(food.category)
                .foregroundColor(.blue)
            Text(food.meal)
                .font(.headline)
                .bold()
                .foregroundColor(.white)
            
            HStack{
                Image(systemName: "clock.fill")
                    .foregroundColor(.white)
                Text("10:03")
                    .font(.subheadline)
                    .foregroundColor(Utills.orange)
            }.padding(.vertical,8)
            HStack(spacing:0){
                ForEach(0..<5){_ in
                    Image(systemName: "star.fill")
                        .font(.headline)
                        .foregroundColor(Utills.orange)
                }
            }
        }
        .frame(height: 200)
        .padding()
        .background(Utills.grey)
        .cornerRadius(20)
        .onTapGesture {
            showDetail.toggle()
        }
        .fullScreenCover(isPresented: $showDetail, content: {
            FoodDetailView(food: food)
        })
        .onAppear{
            isChecked = viewMadel.isSaved(id: food.id)
        }
    }
}

#Preview {
    FreshCell( food: DeveloperPreview.instance.food)
        .frame(width: UIScreen.width/2)
        .environmentObject(SavedFoodViewModel())
}
