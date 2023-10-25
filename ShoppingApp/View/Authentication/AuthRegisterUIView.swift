//
//  AuthUIView.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 24/10/2023.
//

import SwiftUI

struct AuthRegisterUIView: View {
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    
    var body: some View {
        
        NavigationStack {
            VStack {
                Text(NSLocalizedString("Register_Title", comment: ""))
                    .font(.bold(.largeTitle)()).foregroundColor(Color(red: 0.66, green: 0.61, blue: 0.99))
                    .font(.system(size: 180))
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .padding(50)
                HStack {
                    Text(NSLocalizedString("Register_Sub_Title", comment: ""))
                        .foregroundColor(Color(red: 0.66, green: 0.61, blue: 0.99))
                        .font(.system(size: 15))
                    NavigationLink(destination: AuthLoginUIView()) {
                          Text("Login")
                              .foregroundColor(Color(red: 0.66, green: 0.61, blue: 0.99))
                    }
                }
                Group {
                    VStack(alignment: .leading){
                        Text(NSLocalizedString("Register_Name_label", comment: ""))
                            .font(.caption)
                            .foregroundColor(Color(red: 0.49, green: 0.49, blue: 0.49))
                        TextField("Aoron Loeb", text: $name)
                            .textFieldStyle(OvalTextFieldStyle())
                        
                        Text(NSLocalizedString("Register_Email_label", comment: ""))
                            .font(.caption)
                            .foregroundColor(Color(red: 0.49, green: 0.49, blue: 0.49))
                        TextField("your_mail.com", text: $email)
                            .textFieldStyle(OvalTextFieldStyle())
                        
                        Text(NSLocalizedString("Register_Pass_label", comment: ""))
                            .font(.caption)
                            .foregroundColor(Color(red: 0.49, green: 0.49, blue: 0.49))
                        TextField("*********", text: $password)
                            .textFieldStyle(OvalTextFieldStyle())
                    }.padding()
                    
                    Button(action: {
                        print("Register Button Pressed")
                    }) {
                        Text(NSLocalizedString("Register_Button_Label", comment: ""))
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
                }
            }
            .padding()
            .background(Image("AuthBlankBackGround"))

        }.accentColor(.white)
    }
}

struct AuthRegisterUIView_Previews: PreviewProvider {
    static var previews: some View {
        AuthRegisterUIView()
    }
}
