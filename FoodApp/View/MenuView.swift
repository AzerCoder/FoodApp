//
//  MenuView.swift
//  FoodApp
//
//  Created by A'zamjon Abdumuxtorov on 24/07/24.
//

import SwiftUI

struct MenuView: View {
    @Binding var showMenu:Bool
    @Binding var ishShow:Bool
    var body: some View {
        ZStack {
            LinearGradient(colors: [Utills.black,Utills.black.opacity(0.8)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(alignment:.leading,spacing: 40){
                HStack {
                    Image("person")
                    VStack(alignment:.leading){
                        Text("Denny")
                            .font(.title)
                            .bold()
                        Text("View Profile")
                            .foregroundColor(Utills.orange)
                        
                    }
                    Spacer()
                }
                
                Button {
                    showMenu.toggle()
                } label: {
                    MenuComponent(image: "house.fill", text: "Home")
                }

                Button {
                    ishShow.toggle()
                    showMenu.toggle()
                } label: {
                    MenuComponent(image: "heart.fill", text: "Fovourite")
                }

                MenuComponent(image: "play.circle.fill", text: "History")
                MenuComponent(image: "figure.2.and.child.holdinghands", text: "Help")
                MenuComponent(image: "rectangle.portrait.and.arrow.forward.fill", text: "Logout")
                
                Spacer()
            }.padding()
            .foregroundColor(.white)
        }
    }
    
}

#Preview {
    MenuView(showMenu: .constant(false), ishShow: .constant(false))
}
