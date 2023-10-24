//
//  AuthUIView.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 24/10/2023.
//

import SwiftUI

struct AuthUIView: View {
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    
    var body: some View {
        NavigationStack {
            VStack{
                Text(NSLocalizedString("Register_Title", comment: ""))
                    .font(.title).foregroundColor(.purple)
                    .font(.system(size: 120))
                    .padding(50)
                HStack {
                    Text(NSLocalizedString("Register_Sub_Title", comment: ""))
                    Button("Login") {
                       print("login button tapped")
                    }
                }
                Group {
                    // Register Text Fiels
                    Text(NSLocalizedString("Register_Name_label", comment: ""))
                    TextField("Aoron Loeb", text: $name)
                    
                    Text(NSLocalizedString("Register_Email_label", comment: ""))
                    TextField("your_mail.com", text: $email)
                    
                    Text(NSLocalizedString("RRegister_Pass_label", comment: ""))
                    TextField("*********", text: $password)
                    
                    // Register Button
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

        }
    }
}

struct AuthUIView_Previews: PreviewProvider {
    static var previews: some View {
        AuthUIView()
    }
}
