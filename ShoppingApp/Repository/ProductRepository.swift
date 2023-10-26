//
//  ProductRepository.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 24/10/2023.
//

import Foundation
import Combine

protocol ProductRepositoryContract {
    
    func getProduct(for url: URL) async throws -> [Product]
    
}

struct ProductRepository {
    
    private let networkManager: Networkable
    
    init(networkManager: Networkable = NetworkManager()) {
        self.networkManager = networkManager
    }
    
}

//extension ProductRepository: ProductRepositoryContract {
//
//    func getProduct(for url: URL) async throws -> [Product] {
//
//        let productsData = try await networkManager.getData(url: url)
//        print("============================> Response : \(productsData)")
//        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        let products = try decoder.decode([Product].self, from: productsData)
//        print("-----------------------------> Decoded : \(products)")
//        return products
//
//    }
//
//}

extension ProductRepository: ProductRepositoryContract {
    
    func getProduct(for url: URL) async throws -> [Product] {
        
        let productsData = try await networkManager.getData(url: url)
//        print("============================> Response : \(productsData)")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let products = try decoder.decode(OnlineStore.self, from: productsData)
        print("-----------------------------> Decoded : \(products.products)")
        return products.products
        
    }
    
}
