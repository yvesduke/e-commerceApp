//
//  ProductListCoreDataRepository.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 31/10/2023.
//

import Foundation
import CoreData

class ProductCoreDataRepository {
    
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func saveProductsToDb(products: [Product]) async throws {
        products.forEach { product in
            let entity = ProductEntity(context: context)
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
            entity.images = product.images as NSObject
        }
        do {
            try context.save()
        } catch let error {
            print(error.localizedDescription)
            throw CoreDataError.savingError
        }
    }
    
    func getProductsFromDb() async throws -> [ProductEntity] {
        let fetchRequest: NSFetchRequest<ProductEntity>
        fetchRequest = ProductEntity.fetchRequest()
        let products = try context.fetch(fetchRequest)
        return products
    }
    
}




