//
//  AuthUIView.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 24/10/2023.
//

import SwiftUI

struct AuthUIView: View {
    var body: some View {
//        Text("Hello, World!")
        NavigationStack {
            Text("Login Page")
                .font(.system(size: 51))
                .padding(50)
                .background(Image("AuthBlankBackGround"))
        }
    }
}

struct AuthUIView_Previews: PreviewProvider {
    static var previews: some View {
        AuthUIView()
    }
}
