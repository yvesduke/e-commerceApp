//
//  ProductViewModel.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 24/10/2023.
//

import Foundation
import Combine

protocol ProductViewModelAction: ObservableObject {
    func getProductList(url: String) async
}

final class ProductViewModel {
    private var products: [Product] = []
    private let repository: ProductRepositoryContract
    
    @Published var viewState: ViewState = .load(products: [])
    
    init(repository: ProductRepositoryContract = ProductRepository()) {
        self.repository = repository
    }
}

extension ProductViewModel: ProductViewModelAction {
    func getProductList(url: String) async {
        guard let url = URL(string: url) else {
            viewState = .error(message:"Invalid URL")
            return
        }
        do {
            products = try await repository.getProduct(for: url)
            await MainActor.run {
                viewState = .load(products: products)
            }
        } catch {
            await MainActor.run {
                viewState = .error(message:"Something went wrong, Pls try again")
            }
        }
    }
}
