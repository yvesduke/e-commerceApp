//
//  LoginViewModel.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 30/10/2023.
//

import Firebase

class LoginViewModel: ObservableObject {
    
    func loginUser(email: String, password: String) {
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password){result, err in
            if let err = err {
                print("Failed to logn user", err)
                return
            }
            print("Successfully logged in as user: \(result?.user.uid ?? "")")
        }
    }
    
    
    func createNewAccount(email: String, password: String) {
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password){ result, err in
            if let err = err {
                print("Failed to create user:", err)
                return
            }
            print("Successfully created user: \(result?.user.uid ?? "")")
        }
    }
    
}
