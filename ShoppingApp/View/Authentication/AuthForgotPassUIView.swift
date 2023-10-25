//
//  AuthForgotPassUIView.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 25/10/2023.
//

import SwiftUI

struct AuthForgotPassUIView: View {
    
    @State private var email: String = ""
    
    var body: some View {
        
        NavigationStack {
            VStack {
                
                Text(NSLocalizedString("Forgot_Pass_Title_Label", comment: ""))
                    .font(.bold(.largeTitle)()).foregroundColor(Color(red: 0.66, green: 0.61, blue: 0.99))
                    .font(.system(size: 180))
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .padding(50)
                
                    Text(NSLocalizedString("Forgot_Pass_Sub_Title_Label", comment: ""))
                        .foregroundColor(Color(red: 0.66, green: 0.61, blue: 0.99))
                        .font(.system(size: 15))
                
                    VStack(alignment: .leading){
                        
                        Text(NSLocalizedString("Forgot_Pass_Email_Label", comment: ""))
                            .font(.caption)
                            .foregroundColor(Color(red: 0.49, green: 0.49, blue: 0.49))
                        TextField("your_mail.com", text: $email)
                            .textFieldStyle(OvalTextFieldStyle())
                    }.padding()
                    
                    Button(action: {
                        print("Forgot Pass Button Pressed")
                    }) {
                        Text(NSLocalizedString("Forgot_Pass_Button_Label", comment: ""))
                            .frame(width: 120, height: 15)
                            .padding()
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.pink, lineWidth: 3)
                            )
                    }
                    .background(Color.purple)
                    .cornerRadius(30)
                
                NavigationLink(destination: ProductsUIView()) {
                      Text("Skip")
                          .foregroundColor(Color(red: 0.66, green: 0.61, blue: 0.99))
                }.padding()
                
            }
            .padding()
            .background(Image("AuthBlankBackGround"))
        }
    }
}

struct AuthForgotPassUIView_Previews: PreviewProvider {
    static var previews: some View {
        AuthForgotPassUIView()
    }
}
