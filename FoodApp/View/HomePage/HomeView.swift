//
//  HomeView.swift
//  FoodApp
//
//  Created by A'zamjon Abdumuxtorov on 24/07/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var vm:HomeViewModel
    @EnvironmentObject var viewModel: SavedFoodViewModel
    @State private var menuOpen: Bool = false
    @State private var isShow:Bool = false
    
    var body: some View {
        ZStack {
            NavigationView {
                ZStack {
                    
                    LinearGradient(colors: [Utills.black,Utills.black.opacity(0.8)], startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                    
                    
                    ScrollView(showsIndicators:false){
                        header
                        if vm.searchText.isEmpty{
                            freshCells
                        }
                     
                        foodCells
                        
                    }
                    
                    .navigationBarItems(
                        leading: Button(action: {
                            menuOpen.toggle()
                        }, label: {
                            Image(systemName: "list.dash")
                                .bold()
                                .foregroundColor(.white)
                        }),
                        trailing:NavigationLink(destination:CategoryView(), label: {
                            Image(systemName: "square.grid.2x2.fill")
                                .foregroundColor(.white)
                        })
                        
                        
                        
                    )
                    .fullScreenCover(isPresented: $isShow, content: {
                        FavouriteView(isShow: $isShow)
                    })
                    .onDisappear{
                        vm.searchText = ""
                    }
                }
                
            }
           
            menuButtonAction
        }
    }
    
}
#Preview {
    HomeView()
        .environmentObject(HomeViewModel())
        .environmentObject(SavedFoodViewModel())
}


extension HomeView{
    private var header: some View{
        VStack(alignment:.leading){
            HStack{
                Text("Welcome")
                    .font(.title)
                    .foregroundStyle(.white)
                Text("Denny")
                    .font(.title)
            }.fontWeight(.semibold)
                .foregroundColor(Utills.orange)
            
            Text("What would you like to cook today?")
                .font(.title).bold()
                .foregroundColor(Utills.orange)
            HStack {
                SearchBarView(searchText: $vm.searchText)
                
                Image(systemName: "")
            }
            .padding(.vertical,10)
        }.padding(.horizontal)
    }
    
    private var freshCells:some View{
        VStack{
            HStack{
                Text("Today's Fresh Recipe")
                    .bold().font(.headline)
                    .foregroundColor(.white)
                Spacer()
                Button {
                    
                } label: {
                    Text("See All")
                        .bold().font(.headline)
                }
                
            }.opacity(vm.foods.isEmpty ? 0:1)
                .foregroundColor(Utills.orange)
                .padding(.bottom,10)
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(vm.foods,id:\.id){ food in
                        FreshCell(viewMadel: viewModel, food:food)
                            .frame(width: UIScreen.width/2-20)
                    }
                }
            }
        }.padding(.horizontal)
            .padding(.top)
    }
    
    private var foodCells:some View{
        VStack{
            HStack{
                Text("Recommended")
                    .bold().font(.headline)
                    .foregroundColor(.white)
                Spacer()
                Button {
                    
                } label: {
                    Text("See All")
                        .bold().font(.headline)
                }
                
            }.opacity(vm.foods.isEmpty ? 0:1)
                .foregroundColor(Utills.orange)
                .padding(.bottom,10)
            
            
            ForEach(vm.foods,id:\.id){ food in
                FoodCell(viewMadel: viewModel, food: food)
            }
        }.padding(.horizontal)
            .padding(.top)
    }
    
    
    private var menuButtonAction:some View{
        
        ZStack {
            if menuOpen {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            menuOpen = false
                        }
                    }
            }
            
            GeometryReader { geometry in
                HStack {
                    MenuView(showMenu: $menuOpen, ishShow: $isShow)
                    .frame(width: geometry.size.width * 0.7)
                    .background(Color.white)
                    .offset(x: menuOpen ? 0 : -geometry.size.width)
                    .animation(.easeInOut, value: menuOpen)
                    
                    Spacer()
                }
            }
            .gesture(
                DragGesture()
                    .onEnded { value in
                        if value.translation.width > 100 {
                            // O'ngga siljish - menyuni yopish
                            withAnimation {
                                menuOpen = false
                            }
                        } else if value.translation.width < -100 {
                            // Chapga siljish - menyuni ochish
                            withAnimation {
                                menuOpen = true
                            }
                        }
                    }
        )
        }
    }
}
