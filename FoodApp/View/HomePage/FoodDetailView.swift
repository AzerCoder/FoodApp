//
//  FoodDetailView.swift
//  FoodApp
//
//  Created by A'zamjon Abdumuxtorov on 24/07/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct FoodDetailView: View {
    @EnvironmentObject var viewMadel : SavedFoodViewModel
    @State var isChecked:Bool = false
    @Environment(\.dismiss) var dissmis
    
    let food : Meal
    var body: some View {
        NavigationView{
            ZStack {
                LinearGradient(colors: [Utills.black,Utills.black.opacity(0.9)], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack (alignment:.leading,spacing:8){
                    
                    ScrollView (showsIndicators:false){
                        header
                        bodyImage
                        ingredients
                        instructions
                        
                    }
                    Link(destination: URL(string: food.youtube)!) {
                        Text("Video")
                            .font(.title2).bold()
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(Utills.orange)
                            .cornerRadius(20)
                    }
                    
                }
                .padding(.horizontal)
            }
            .navigationBarItems(
                leading: Button(action: {
                    dissmis()
                }, label: {
                    Image(systemName: "arrow.left")
                        .bold().font(.title2)
                        .foregroundColor(Utills.orange)
                }),
                trailing: Button(action: {
                    
                }, label: {
                    Image(systemName: "bell.fill")
                        .foregroundColor(.white)
                })
            )
        }
        .onAppear{
            isChecked = viewMadel.isSaved(id: food.id)
        }
        
    }
}

#Preview {
        FoodDetailView(food: DeveloperPreview.instance.food)
        .environmentObject(SavedFoodViewModel())
}


extension FoodDetailView{
    private var header: some View{
        VStack(alignment:.leading,spacing:8){
            Text(food.category)
                .foregroundColor(.blue)
                .padding(.top)
            HStack {
                Text(food.meal)
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
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
                        .foregroundColor( isChecked ? Utills.orange:.grey)
                }
                
            }.padding(.bottom,10)
            
            HStack(spacing:0){
                ForEach(0..<5){_ in
                    Image(systemName: "star.fill")
                        .font(.headline)
                        .foregroundColor(Utills.orange)
                }
            }
        }
    }
    
    private var bodyImage: some View{
        HStack(alignment:.center){
            VStack(alignment:.leading,spacing:10){
                HStack{
                    Image(systemName: "clock")
                        .font(.title2)
                    Text("10 mins")
                }
                HStack{
                    Image(systemName: "globe")
                        .font(.title2)
                    Text(food.area)
                }
                HStack{
                    Image("serving")
                        .resizable()
                        .frame(width: 25,height: 25)
                    Text("1 Serving")
                }
            }
            Spacer()
            WebImage(url:URL(string: food.mealThumb))
                .resizable()
                .frame(width: 200,height: 200)
                .cornerRadius(20)
            
        }
        .foregroundColor(Utills.grey)
        
    }
    
    
    private var ingredients:some View{
        VStack(alignment:.leading){
            Text("Ingredients")
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .padding(.bottom,8)
            
            let measures = [food.measure1, food.measure2, food.measure3, food.measure4, food.measure5, food.measure6, food.measure7, food.measure8, food.measure9, food.measure10]
            let ingredients = [food.ingredient1, food.ingredient2, food.ingredient3, food.ingredient4, food.ingredient5, food.ingredient6, food.ingredient7, food.ingredient8, food.ingredient9, food.ingredient10]
            
            ForEach(0..<measures.count, id: \.self) { index in
                if let measure = measures[index], !measure.isEmpty,
                   let ingredient = ingredients[index], !ingredient.isEmpty {
                    HStack {
                        Text("-")
                        Text(measure)
                        Text(ingredient)
                        Spacer()
                    }
                    .foregroundColor(.gray)
                }
            }
        }.foregroundColor(.gray)
           
    }
    
    private var instructions:some View{
        VStack(alignment:.leading){
            Text("Instructions")
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .padding(.vertical,8)
            Text(food.instructions)
                .padding(.bottom)
        }.foregroundColor(.gray)
    }
}
