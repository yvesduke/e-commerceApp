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
    
    func getProductList(url: String, context: NSManagedObjectContext) async {
        
        await getProductsFromDb(context: context)
        
        if hasDbData {
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
}

extension ProductViewModel {
    
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
    
//    func getSearchResult() {
//        self.viewState = .searchload(product: filteredProducts)
//    }
    
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
