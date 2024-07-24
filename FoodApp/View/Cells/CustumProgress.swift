//
//  CustumProgress.swift
//  FoodApp
//
//  Created by A'zamjon Abdumuxtorov on 25/07/24.
//


import SwiftUI


struct MultiColorDottedRingProgressViewStyle: ProgressViewStyle {
    @State private var isAnimating = false

    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .trim(from: 0, to: 0.8)
                .stroke(style: StrokeStyle(lineWidth:  6, lineCap: .round, dash: [0.1, 16]))
                .foregroundColor(Utills.orange)
                .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                .frame(width: 45, height: 45)
                .overlay(
                    Circle()
                        .trim(from: 0, to: 0.8)
                        .stroke(AngularGradient(gradient: Gradient(colors: [.red, Utills.orange,.yellow]), center: .center), lineWidth:  6)
                        .rotationEffect(Angle(degrees: isAnimating ? -360 : 0))
                        .frame(width:45, height: 45)
                )
                .onAppear {
                    withAnimation(Animation.linear(duration: 2.0).repeatForever(autoreverses: false)) {
                        isAnimating = true
                    }
                }
        }
    }
}



struct CustumProgress: View {
    var body: some View {
        VStack{
            ProgressView()
                .progressViewStyle(MultiColorDottedRingProgressViewStyle())
                            
        }
    }
}

#Preview {
    ZStack {
        Utills.grey.ignoresSafeArea()
        CustumProgress()
    }
    
}
