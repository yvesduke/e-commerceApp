//
//  ProductSearchView.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 07/11/2023.
//

import SwiftUI

struct ProductSearchView: View {
    
    @StateObject var viewModel = ProductViewModel()
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(viewModel.filteredProducts) { product in
                    ProductCellUIView(product: product, dbProduct: nil)
                }
//                .listRowSeparator(.hidden, edges: .all)
            }
            .listStyle(.plain)
            .navigationTitle("Find your next Product")
//            .searchable(text: $viewModel.searchText)
            .searchable(text: $viewModel.searchText,
                   placement: .navigationBarDrawer(displayMode: .always))
        }
    }
}

//struct ProductSearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductSearchView()
//    }
//}
