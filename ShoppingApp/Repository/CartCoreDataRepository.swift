//
//  CartCoreDataRepository.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 09/11/2023.
//

import Foundation
import CoreData

class CartCoreDataRepository {
    
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func saveProductsToDb(products: [Product]) async throws {
        products.forEach { product in
            let entity = CartEntity(context: context)
            entity.id = Int64(product.id)
            entity.title = product.title
            entity.descriptions = product.description
            entity.price = Int16(product.price)
            entity.discountPercentage = product.discountPercentage
            entity.rating = product.rating
            entity.stock = Int16(product.stock)
            entity.brand = product.brand
            entity.category = product.category
            entity.thumbnail = product.thumbnail
            entity.images = product.images
        }
        do {
            try context.save()
        } catch let error {
            print(error.localizedDescription)
            throw CoreDataError.savingError
        }
    }
    
    func getProductsFromDb() async throws -> [CartEntity] {
        let fetchRequest: NSFetchRequest<CartEntity>
        fetchRequest = CartEntity.fetchRequest()
        let products = try context.fetch(fetchRequest)
        return products
    }
    
}





