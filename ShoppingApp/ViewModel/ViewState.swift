//
//  ViewState.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 24/10/2023.
//

import Foundation

enum ViewState: Equatable {
    case load(products: [Product])
    case error(message: String)
    
    static func == (lhs: ViewState, rhs: ViewState) -> Bool {
        switch (lhs, rhs) {
        case (.load(products: let lProducts), .load(products: let rProducts)):
            return lProducts.count == rProducts.count
         
        case (.error(message: let lMessage), .error(message: let rMessage)):
            return lMessage == rMessage
        case (.error(message:  _), .load(products: _)):
            return false
        case (.load(products:  _), .error(message: _)):
            return false
        }
    }
}