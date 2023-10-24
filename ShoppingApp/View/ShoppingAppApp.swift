//
//  ShoppingAppApp.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 19/10/2023.
//

import SwiftUI

@main
struct ShoppingAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            AuthUIView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
