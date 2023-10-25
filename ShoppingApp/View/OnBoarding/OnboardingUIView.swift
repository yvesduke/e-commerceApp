//
//  OnboardingUIView.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 24/10/2023.
//

import SwiftUI

struct OnboardingUIView: View {
    
    var data: OnboardingModel
    
    @State private var isAnimating: Bool = false
        
    var body: some View {
        
        VStack {
            ZStack {
                Image(data.backgroundImage)
                    .resizable()
//                    .scaledToFit()
                    .frame(width: 180.0, height: 180.0)
        
                
//                Image(data.objectImage)
//                    .resizable()
//                    .scaledToFit()
////                    .scaledToFill()
//                    .offset(x: 0, y: 150)
//                    .scaleEffect(isAnimating ? 1 : 0.9)
            }.padding()
            
            Spacer()
            Spacer()
            
            Text(data.titleLabel)
                .font(.title2)
                .bold()
                .foregroundColor(Color(red: 0.66, green: 0.61, blue: 0.99))
            
            Text(data.subTitleLabel)
                .font(.subheadline)
                .multilineTextAlignment(.center)
//                .frame(maxWidth: 250)
//                .foregroundColor(Color(red: 0.66, green: 0.61, blue: 0.99))
                .foregroundColor(Color(red: 0.49, green: 0.49, blue: 0.49))
//                .shadow(color: Color.black.opacity(0.1), radius: 1, x: 2, y: 2)
            
            Spacer()
            
            Button(action: {
                // Navigate to Register View
            }, label: {
                Text("Get Started")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal, 50)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color(red: 0.66, green: 0.61, blue: 0.99))
                    )
            })
            .shadow(radius: 10)
            
            Spacer()
        }
        .padding()
        .onAppear(perform: {
            isAnimating = false
            withAnimation(.easeOut(duration: 0.6)) {
                self.isAnimating = true
            }
        })
    }
}

struct OnboardingUIView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingUIView(data: OnboardingModel.list.first!)
    }
}
