//
//  FirebaseManager.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 31/10/2023.
//

import Firebase

class FirebaseManager: NSObject {
    
    let auth: Auth
    
    static let shared = FirebaseManager()
    
    override init() {
        FirebaseApp.configure()
        self.auth = Auth.auth()
        super.init()
    }
}
