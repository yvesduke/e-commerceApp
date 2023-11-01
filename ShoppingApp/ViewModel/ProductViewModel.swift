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
    
    @Published var viewState: ViewState = .load(products: [])
    
    init(repository: ProductRepositoryContract = ProductRepository()) {
        self.productRepo = repository
    }
}

extension ProductViewModel: ProductViewModelAction {
    func getProductList(url: String, context: NSManagedObjectContext) async {
        guard let url = URL(string: url) else {
            viewState = .error(message:"Invalid URL")
            return
        }
        do {
            products = try await productRepo.getProduct(for: url)
            
            await self.saveProductsToDB(context: context) // After network response, we save data in DB
            
            await MainActor.run {
                viewState = .load(products: products)
            }
        } catch {
            await MainActor.run {
                viewState = .error(message:"Something went wrong, Pls try again")
            }
        }
    }
    
    private func saveProductsToDB(context: NSManagedObjectContext) async {
        coreDataRepo = ProductCoreDataRepository(context: context)
        do {
            try await coreDataRepo?.saveProductsToDb(products: products)
            print("Db Saved Successfully")
        }catch{
            print("Failed to save data to Db")
            self.viewState = .error(message:"Could not save data to Db")
        }
    }
    
    func getProductsFromDb(context: NSManagedObjectContext) async {
        coreDataRepo = ProductCoreDataRepository(context: context)
        do {
            if let products = try await coreDataRepo?.getProductsFromDb() {
                print("Db data retrieved succcessfully")
                DispatchQueue.main.async {
                    self.viewState = .dbload(dbProducts: products)
                }
            }
            
        } catch {
            print("DB fetch Failed")
            self.viewState = .error(message: "Could not retrieve Db Data")
        }
    }
    
    
}
