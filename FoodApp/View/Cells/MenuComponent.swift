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
                .frame(width: 35,height: 35)
            
            Text(text)
                .font(.title)
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
