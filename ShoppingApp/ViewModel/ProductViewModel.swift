//
//  ProductViewModel.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 24/10/2023.
//

import Foundation
import Combine
import CoreData

protocol ProductViewModelAction: ObservableObject {
    func getProductList(url: String, context: NSManagedObjectContext) async
}

final class ProductViewModel {
    private var products: [Product] = []
//    private var productsDb:[ProductEntity] = []
    private let productRepo: ProductRepositoryContract
    private var coreDataRepo: ProductCoreDataRepository?
    private var hasDbData: Bool = false
    
    @Published var viewState: ViewState = .load(products: [])
    
    init(repository: ProductRepositoryContract = ProductRepository()) {
        self.productRepo = repository
    }
}

extension ProductViewModel: ProductViewModelAction {
    
    func getProductList(url: String, context: NSManagedObjectContext) async {
        
        await getProductsFromDb(context: context)
        
        if hasDbData {
//            await self.getProductsFromDb(context: context)
            print("============> We have database")
        } else {
            // Remote Data
            guard let url = URL(string: url) else {
                viewState = .error(message:"Invalid URL")
                return
            }
            do {
                products = try await productRepo.getProduct(for: url)
                
                await saveProductsToDB(context: context)
                
                await MainActor.run {
                    viewState = .load(products: products)
                    hasDbData = true
                }
            } catch {
                await MainActor.run {
                    viewState = .error(message:"Something went wrong, Pls try again")
                }
            }
        }
    
        
        
        
        
        
        
        // ===========================================================================
//        guard let url = URL(string: url) else {
//            viewState = .error(message:"Invalid URL")
//            return
//        }
//        do {
//            products = try await productRepo.getProduct(for: url)
//
//            await self.saveProductsToDB(context: context)
//
//            await MainActor.run {
//                viewState = .load(products: products)
//            }
//        } catch {
//            await MainActor.run {
//                viewState = .error(message:"Something went wrong, Pls try again")
//            }
//        }
       // ===========================================================================
        
        
        
        
    }
    
    private func saveProductsToDB(context: NSManagedObjectContext) async {
        coreDataRepo = ProductCoreDataRepository(context: context)
        do {
            try await coreDataRepo?.saveProductsToDb(products: products)
            print("Db Saved Successfully")
            self.hasDbData = true
        }catch{
            print("Failed to save data to Db")
            self.viewState = .error(message:"Could not save data to Db")
            self.hasDbData = false
        }
    }
    
    private func getProductsFromDb(context: NSManagedObjectContext) async {
//        coreDataRepo = ProductCoreDataRepository(context: context)
        do {
            if let products = try await coreDataRepo?.getProductsFromDb() {
                
                print("Db data retrieved succcessfully")
                DispatchQueue.main.async {
                    self.hasDbData = true
                    self.viewState = .dbload(dbProducts: products)
                }
            }
        } catch {
            print("DB fetch Failed")
            self.viewState = .error(message: "Could not retrieve Db Data")
            hasDbData = false
        }
    }
    
    
}

extension ProductViewModel {
    
    func removeDuplicates<T>(category: [T]) -> [String] {
        
        //        for item in products {
        //            print(item, terminator: " ")
        //        }
        
        var uniqueCategories: [String] {
            var uniqueCategoriesSet = Set<String>()
            var result = [String]()
            for product in products {
                if !uniqueCategoriesSet.contains(product.category) {
                    uniqueCategoriesSet.insert(product.category)
                    result.append(product.category)
                }
            }
            return result
        }
        
        return uniqueCategories
    }
    
}
