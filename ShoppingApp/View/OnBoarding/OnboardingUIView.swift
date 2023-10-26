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
    @State private var showAuthRegister: Bool = false
        
    var body: some View {
            VStack {
                ZStack {
                    Image(data.backgroundImage)
                        .resizable()
                        .frame(width: 180.0, height: 180.0)
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
                    .foregroundColor(Color(red: 0.49, green: 0.49, blue: 0.49))
                Spacer()
                
                Button(action: {
                    // Perform Action
                    showAuthRegister = true
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
            .fullScreenCover(isPresented: $showAuthRegister, content: {
                AuthRegisterUIView(isPresented: $showAuthRegister)
            })
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
