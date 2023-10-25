//
//  AuthLoginUIView.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 25/10/2023.
//

import SwiftUI

struct AuthLoginUIView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        
        NavigationStack {
            VStack {
                Text(NSLocalizedString("Login_Title", comment: ""))
                    .font(.bold(.largeTitle)()).foregroundColor(Color(red: 0.66, green: 0.61, blue: 0.99))
                    .font(.system(size: 180))
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .padding(50)
//                HStack {
                    Text(NSLocalizedString("Login_Sub_Title", comment: ""))
                        .foregroundColor(Color(red: 0.66, green: 0.61, blue: 0.99))
                        .font(.system(size: 15))
//                    Button(action: {
//                        print("Login Button Pressed")
//                    }) {
//                        Text("Login")
//                            .foregroundColor(Color(red: 0.66, green: 0.61, blue: 0.99))
//                    }
//                }
                Group {
                    VStack(alignment: .leading){
                        // Login Text Fiels
                        Text(NSLocalizedString("Enter_Email_Label", comment: ""))
                            .font(.caption)
                            .foregroundColor(Color(red: 0.49, green: 0.49, blue: 0.49))
                        TextField("your_mail.com", text: $email)
                            .textFieldStyle(OvalTextFieldStyle())
                        
                        Text(NSLocalizedString("Enter_Pass_Label", comment: ""))
                            .font(.caption)
                            .foregroundColor(Color(red: 0.49, green: 0.49, blue: 0.49))
                        TextField("*********", text: $password)
                            .textFieldStyle(OvalTextFieldStyle())
                    }.padding()
                    
                    
                    // Login Button
                    Button(action: {
                        print("Login Button Pressed")
                    }) {
                        Text(NSLocalizedString("Login_Button_Label", comment: ""))
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

                    
                    HStack {
//                        Text(NSLocalizedString("Login_Sub_Title", comment: ""))
//                            .foregroundColor(Color(red: 0.66, green: 0.61, blue: 0.99))
//                            .font(.system(size: 15))
                        NavigationLink(destination: AuthForgotPassUIView()) {
                              Text("Forgot Password")
                                  .foregroundColor(Color(red: 0.66, green: 0.61, blue: 0.99))
                        }
                    }
                    
                    
                }
            }
            .padding()
            .background(Image("AuthBlankBackGround"))
            
        }
    }
}

struct AuthLoginUIView_Previews: PreviewProvider {
    static var previews: some View {
        AuthLoginUIView()
    }
}
