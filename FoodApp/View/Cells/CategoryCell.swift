//
//  CategoryCell.swift
//  FoodApp
//
//  Created by A'zamjon Abdumuxtorov on 25/07/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct CategoryCell: View {
    @State var showDetail = false
    let category : Category
    var body: some View {
        
        VStack(alignment:.leading){
            HStack(alignment:.top){
               
                WebImage(url: URL(string: category.categoryThumb))
                    .resizable()
                    .frame(width: 140,height: 140)
                    .cornerRadius(20)
            }
            
            Text(category.category)
                .font(.title2)
                .bold()
                .foregroundColor(Utills.orange)
            
          
        }
        .frame(width: UIScreen.width/2-60)
        .padding()
        .background(Utills.grey)
        .cornerRadius(20)
        .frame(width: UIScreen.width/2-20,height: 200)
        .onTapGesture {
            showDetail.toggle()
        }
        .fullScreenCover(isPresented: $showDetail, content: {
           DetailView(category: category)
        })
        
    }
}


#Preview {
    CategoryCell(category: DeveloperPreview.instance.category)
}
