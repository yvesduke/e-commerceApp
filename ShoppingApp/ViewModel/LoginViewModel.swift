//
//  LoginViewModel.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 30/10/2023.
//

import Firebase
import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var error: NetworkError?

    func loginUser(email: String, password: String) {
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("Failed to login user", error)
                self.error = .loginError
                return
            }
            
            if let firebaseUser = result?.user {
                fbUser =  User(uid: firebaseUser.uid, email: firebaseUser.email, displayName: firebaseUser.displayName)
                print("Successfully logged in as user: \(firebaseUser.uid)")
            }
        }
        

        // -- for Debugging purprose: Print the divice ID and App ID to allow me to navigate by CoreData Data
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print("---------------------------------------->>> \(paths[0])")
        
    }

    
    
    func createNewAccount(email: String, password: String) {
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password){ result, err in
            if let err = err {
                print("Failed to create user:", err)
                self.error = .singUpError
                return
            }
        }
    }
    
}
