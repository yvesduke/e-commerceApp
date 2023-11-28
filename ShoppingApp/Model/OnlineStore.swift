//
//  OnlineStore.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 24/10/2023.
//

import Foundation

var cartItems: [Product] = []

struct OnlineStore: Decodable {
    let products: [Product]
    let total, skip, limit: Int
}


struct Product: Decodable, Identifiable {
    
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}

extension Product {
    static func getProducts() -> [Product] {
        return [
            Product(id: 1, title: "Lenovo Laptop", description: "Lenova Laptop 2023", price: 600, discountPercentage: 20.0, rating: 5, stock: 120, brand: "Lenova", category: "Laptops", thumbnail: "Lenova thumbs", images: ["img1, img2,img3"]),
            Product(id: 2, title: "iPhone mobile phone", description: "iPhone 15 Pro Mobile phone 2023", price: 1600, discountPercentage: 15.0, rating: 5, stock: 90, brand: "Apple", category: "smartphones", thumbnail: "iPhone thumbs", images: ["img1, img2,img3"]),
            Product(id: 3, title: "perfume Oil", description: "Mega Discount, Impression of Acqua Di Gio by GiorgioArmani concentrated attar perfume Oil", price: 90, discountPercentage: 20.0, rating: 5, stock: 30, brand: "Impression of Acqua Di Gio", category: "fragrances", thumbnail: "https://i.dummyjson.com/data/products/11/thumbnail.jpg", images: ["img1, img2,img3"])
        ]
    }
}
