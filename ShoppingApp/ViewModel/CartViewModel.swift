//
//  CartViewModel.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 08/11/2023.
//

import Foundation
import CoreData
import Combine

class CartViewModel: ObservableObject {
    
//    @Published var cartItems: [CartItem]
//    @Published var cartItems: [CartEntity]
    private var coreDataRepo: CartCoreDataRepository?
    
//    @Published var viewState: ViewState = .load(products: [])
    
    init() {
//        self.cartItems = []
    }
    
    func addToCart(product: Product) {
        
//        var addNewProduct = true
//
//        for (index, item) in cartItems.enumerated() {
//            if item.product.id == product.id {
//                cartItems[index].count = cartItems[index].count + 1
//                addNewProduct = false
//            }
//        }
//        if addNewProduct {
//            cartItems.append(CartItem(product: product, count: 1))
//            print("Added to cart succesfuly")
//            print(cartItems.count)
//        }
        
    }
    
    func removeFromCart(offsets: IndexSet) {
//        cartItems.remove(atOffsets: offsets)
    }
    
    
//    private func saveProductsToDB(context: NSManagedObjectContext) async {
//
//        coreDataRepo = CartCoreDataRepository(context: context)
//
//        do {
//            try await coreDataRepo?.saveProductsToDb(products: cartItems)
//            print("Db Saved Successfully")
//        }catch{
//            print("Failed to save data to Db")
//        }
//    }
    
    
//    private func getProductsFromDb(context: NSManagedObjectContext) async {
//        do {
//            if let dbproducts = try await coreDataRepo?.getProductsFromDb() {
//                await MainActor.run {
////                    self.viewState = .dbload(dbProducts: dbproducts)
//                }
//            }
//        } catch {
//            await MainActor.run {
//                print("DB fetch Failed")
//            }
//        }
//    }
    
}
