//
//  ShoppingAppApp.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 19/10/2023.
//

import SwiftUI
//import FirebaseCore
//import FirebaseFirestore
//import FirebaseAuth

//class AppDelegate: NSObject, UIApplicationDelegate {
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        FirebaseApp.configure()
//        return true
//    }
//}

@main
struct ShoppingAppApp: App {
    let persistenceController = PersistenceController.shared
    
    // register app delegate for Firebase setup
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            WelcomeUIView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
