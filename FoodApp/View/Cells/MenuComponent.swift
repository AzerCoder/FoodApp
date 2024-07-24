//
//  MenuComponent.swift
//  FoodApp
//
//  Created by A'zamjon Abdumuxtorov on 24/07/24.
//

import SwiftUI

struct MenuComponent: View {
    let image:String
    let text:String
    var body: some View {
        HStack{
            Image(systemName: image)
                .resizable()
                .frame(width: 30,height: 30)
            
            Text(text)
                .font(.title2)
                .bold()
                .padding(.leading,30)
            Spacer()
        }.foregroundColor(.white)
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        MenuComponent(image: "", text: "")
    }
}
