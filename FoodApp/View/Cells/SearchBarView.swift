//
//  SearchBarView.swift
//  FoodApp
//
//  Created by A'zamjon Abdumuxtorov on 24/07/24.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText:String
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
            TextField("Search by name ...", text: $searchText)
                .foregroundColor(.white)
                .disableAutocorrection(true)
                .overlay(alignment: .trailing) {
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x:10)
                        .foregroundColor(.white)
                        .opacity(searchText.isEmpty ? 0:1)
                        .onTapGesture {
                            searchText = ""
                        }
                }
        }
        .font(.headline)
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 10.0)
                .fill(.clear)
                .shadow(
                    color: Utills.grey.opacity(0.2),
                    radius: 10)
        )
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.white,lineWidth: 3))
       
    }
}

#Preview {
    SearchBarView(searchText: .constant(""))
        .background(.grey)
}
