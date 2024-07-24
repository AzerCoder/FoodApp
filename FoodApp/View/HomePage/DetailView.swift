//
//  DetailView.swift
//  FoodApp
//
//  Created by A'zamjon Abdumuxtorov on 25/07/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    @Environment(\.dismiss) var dissmis
    let category:Category
    var body: some View {
        NavigationView {
            ZStack{
                LinearGradient(colors: [Utills.black,Utills.black.opacity(0.8)], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                ScrollView{
                    VStack(alignment:.leading){
                        WebImage(url: URL(string: category.categoryThumb))
                        Text(category.category)
                            .font(.largeTitle).bold()
                            .foregroundColor(Utills.orange)
                            .padding(.bottom)
                        Text(category.description)
                            .font(.title2).italic()
                            .foregroundColor(.white)
                    }.padding()
                }
            }
            .navigationBarItems(
                leading: Button(action: {
                    dissmis()
                }, label: {
                    Image(systemName: "arrow.left")
                        .bold().font(.title2)
                        .foregroundColor(Utills.orange)
                })
        )
        }
    }
}

#Preview {
   
        DetailView(category: DeveloperPreview.instance.category)
   
}
