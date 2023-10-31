//
//  ProductsHomeUIView.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 25/10/2023.
//

//slider.horizontal.3
//slider.vertical.3
//touchid

import SwiftUI

struct ProductsHomeUIView: View {

    @State private var searchText: String = ""
    @StateObject var viewModel: ProductViewModel

    var body: some View {
    
        NavigationStack {
            VStack {
                SearchBar(text: $searchText)
                    .padding()
                
                HStack {
                    // Filter Button
                    NavigationLink(destination: FilterUIView()) { //
                        //                          Text("Login")
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(Color(.systemGray2))
                            .font(.system(size: 30))
                    }
                    // Filter by category
                    filterListView()
                }
                .padding()
                
                // Hot Sale
                HStack {
                    Text("Hot Sales")
                        .font(.title3)
                        .bold()
//                        .padding(.leading, 0)
                    Text("See all")
                        .font(.title3)
                        .foregroundColor(Color(.systemGray2))
                        .padding(.leading, 110)
                }
                productsListView()
                
                
                // Recently Viewed
                HStack {
                    Text("Recently Viewed")
                        .font(.title3)
                        .bold()
                    Text("See all")
                        .font(.title3)
                        .foregroundColor(Color(.systemGray2))
                        .padding(.leading, 110)
                }
                productsListView()
                
                
                
            }
            .task {
                await viewModel.getProductList(url: ApiEndpoint.products)
            }
            
            Spacer()
        }
        
//        Spacer()
    }
    
    @ViewBuilder
    func filterListView()-> some View {
        switch viewModel.viewState {
        case .load(products: let products) :
            if products.count > 0 {
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(products) { product in
                                switch viewModel.viewState {
                                case .load(products: let products) :
                                    if products.count > 0 {
//                                        ScrollView(.horizontal) {
                                            LazyHStack {
//                                                ForEach(products) { product in
//                                                    Text(product.category)
//                                                }
                    
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
                                                
                                                ForEach(uniqueCategories, id: \.self) { category in
                                                    Text(category)
                                                        .background(Color(.white))
//                                                        .padding()
                                                        .padding(9)
                                                        .foregroundColor(.gray)
                                                        .overlay(RoundedRectangle(cornerRadius: 15)
                                                        .stroke(Color(red: 0.66, green: 0.61, blue: 0.99), lineWidth: 2))
                                                }
                                            }
//                                            .background(Color.red)
//                                            .frame(width: 150, height: 50)
    
//                                        }
                                    } else {
                                        Text("Loading Data")
                                    }
                                case .error(message: let message) :
                                    Text(message)
                                }
                        }
                    }
                }
//                .background(Color.green)
                .frame(width: 330, height: 50)
            } else {
                Text(NSLocalizedString("loading", comment: ""))
            }
        case .error(message: let message) :
            Text(message)
        }
    }
    
    
    // ===========================
    
    @ViewBuilder
    func productsListView()-> some View {
        
        switch viewModel.viewState {
        case .load(products: let products) :
            if products.count > 0 {
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(products) { product in
                            ProductCellUIView(product: product)
//                                switch viewModel.viewState {
//                                case .load(products: let products) :
//                                    if products.count > 0 {
//                                            LazyHStack {
////                                                ForEach(products) { product in
////                                                    Text(product.category)
////                                                }
//                                            }
//
//                                    } else {
//                                        Text("Loading Data")
//                                    }
//                                case .error(message: let message) :
//                                    Text(message)
//                                }
                        }
                    }
                }
////                .background(Color.green)
//                .frame(width: 330, height: 50)
            } else {
                Text(NSLocalizedString("loading", comment: ""))
            }
        case .error(message: let message) :
            Text(message)
        }
    }
    
    
    
}

struct ProductsHomeUIView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsHomeUIView(viewModel: ProductViewModel())
    }
}
