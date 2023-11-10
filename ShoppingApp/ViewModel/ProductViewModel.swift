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
    func addToFavorites(product: ProductEntity) async throws
    func removeToFavorites(product: ProductEntity) async throws
    func getFavoritesList(product: ProductEntity) async throws
}

final class ProductViewModel {
    
    private var products: [Product] = []
    private let productRepo: ProductRepositoryContract
    private var coreDataRepo: ProductCoreDataRepository?
    private var hasDbData: Bool = false
    
    @Published var viewState: ViewState = .load(products: [])
    @Published var searchText: String = ""
    
    init(repository: ProductRepositoryContract = ProductRepository()) {
        self.productRepo = repository
    }
}

extension ProductViewModel: ProductViewModelAction {
    
    // Get product from the API func
    func getProductList(url: String, context: NSManagedObjectContext) async {
        
        await getProductsFromDb(context: context)
        
        if hasDbData {
            print("============> We have database No need for an API call")
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
//                    viewState = .load(products: filteredProducts)
                    hasDbData = true
                }
            } catch {
                await MainActor.run {
                    viewState = .error(message:"Something went wrong, Pls try again")
                }
            }
        }
    }
    
    
    func addToFavorites(product: ProductEntity) async throws {
        
    }
    
    func removeToFavorites(product: ProductEntity) async throws {
        
    }
    
    func getFavoritesList(product: ProductEntity) async throws {
        
    }
    
}

extension ProductViewModel {
    
    // Get Data from Database func
    private func getProductsFromDb(context: NSManagedObjectContext) async {
        //        coreDataRepo = ProductCoreDataRepository(context: context)
        do {
            if let dbproducts = try await coreDataRepo?.getProductsFromDb() {
                await MainActor.run {
                    self.hasDbData = true
                    self.viewState = .dbload(dbProducts: dbproducts)
                }
            }
        } catch {
            await MainActor.run {
                print("DB fetch Failed")
                self.viewState = .error(message: "Could not retrieve Db Data")
                hasDbData = false
            }
        }
    }
    
    // Save Data to the Database func
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
}

extension ProductViewModel {
    
    //TODO: -- Use generic type so both Product and dbProduct type can work
    var filteredProducts: [Product] {
        guard !searchText.isEmpty else {
            return products
        }
        return products.filter { product in
            product.title.lowercased().contains(searchText.lowercased())
        }
    }
}

extension ProductViewModel {

    func removeDuplicates<T>(category: [T]) -> [String] {
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
