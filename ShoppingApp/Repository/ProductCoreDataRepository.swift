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
    
    func saveProductsToDb(products: [Product], completion: @escaping (Result<Void, Error>) -> Void) {
        let group = DispatchGroup()
        let operationQueue = OperationQueue()
        
        let saveDbOperation = BlockOperation()
        let clearDbOperation = BlockOperation()
        
        saveDbOperation.addExecutionBlock {
        do {
            group.enter()
            
               products.forEach { product in
               let entity = ProductEntity(context: self.context)
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
                entity.prodVariation = ["Green", "Red", "Blue"]
            }
            try self.context.save()
            completion(.success(()))
                group.leave()
            } catch let error {
                print(error.localizedDescription)
                completion(.failure(error))
            }
            
            group.wait()
        }
        
        clearDbOperation.addExecutionBlock {
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductEntity")
            
            do {
                group.enter()
                let entities = try self.context.fetch(fetchRequest)
                for entity in entities {
                    self.context.delete(entity as! NSManagedObject)
                }
                try self.context.save()
                group.leave()
            } catch {
                print("Error clearing entity : \(error)")
            }
            group.wait()
        }
        
        // Add dependency
        saveDbOperation.addDependency(clearDbOperation)
        
        // Create the Operation
        operationQueue.addOperation(saveDbOperation)
        
    }
    
    func getProductsFromDb() async throws -> [ProductEntity] {
        let fetchRequest: NSFetchRequest<ProductEntity>
        fetchRequest = ProductEntity.fetchRequest()
        let products = try context.fetch(fetchRequest)
        return products
    }
    
    private func deleteProductsFromDb() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductEntity")
        
        do {
            let entities = try context.fetch(fetchRequest)
            for entity in entities {
                context.delete(entity as! NSManagedObject)
            }
            try context.save()
        } catch {
            print("Error clearing entity : \(error)")
        }
    }
    
    func getFavoritesFromDb() async throws -> [ProductEntity] {
        let fetchRequest: NSFetchRequest<ProductEntity> = ProductEntity.fetchRequest()
            let filteredResults = try context.fetch(fetchRequest)
        print("]]]]]]]]]]]]]]]]]>>>>>>>>>> \(filteredResults.count) + \(String(describing: filteredResults[1].favorite))")
            return filteredResults
    }
    
    func saveFavoritesToDb(productId: Int, isFavorite: String) async throws {
                
        let fetchRequest: NSFetchRequest<ProductEntity> = ProductEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %lld", Int64(productId))
        
        do {
            let results = try context.fetch(fetchRequest)
            if let UpdateFavorites = results.first {
                UpdateFavorites.favorite = isFavorite
                
                do {
                    try context.save()
                    print("Successfully update the entity.")
                } catch {
                    print("Failed to save changes: \(error).")
                }
            } else {
                print("Product not Found.")
            }
        } catch {
            print("Error fetching person: \(error)")
        }
    }
    
    func saveViewCountToDb(productId: Int) async throws {
            let entity = ProductEntity(context: context)
        if entity.id == productId {
            entity.viewedCount += 1
        }
        do {
            try context.save()
        } catch let error {
            print(error.localizedDescription)
            throw CoreDataError.savingError
        }
    }
    
}




