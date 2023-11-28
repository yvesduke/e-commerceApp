//
//  CartViewModel.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 08/11/2023.
//

import SwiftUI


class CartViewModel: ObservableObject {
    
    private var coreDataRepo: CartCoreDataRepository?
    @Published var Qty: Int = 1
    
    func addToCart(product: Product) {
        
    }
    
    func removeFromCart(offsets: IndexSet) {
    }
    
}
