//
//  ViewState.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 24/10/2023.
//

import Foundation

enum ViewState: Equatable {
    case load(products: [Product])
    case dbload(dbProducts: [ProductEntity])
    case error(message: String)
    
    static func == (lhs: ViewState, rhs: ViewState) -> Bool {
        switch (lhs, rhs) {
        case let (.load(lProducts), .load(rProducts)):
            return lProducts.count == rProducts.count
            
        case let (.dbload(lDbProducts), .dbload(rDbProducts)):
            return lDbProducts.count == rDbProducts.count
            
        case let (.error(lMessage), .error(rMessage)):
            return lMessage == rMessage
            
        default:
            return false
        }
    }
}
