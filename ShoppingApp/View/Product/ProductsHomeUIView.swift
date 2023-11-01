//
//  ProductsHomeUIView.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 25/10/2023.
//

import SwiftUI

struct ProductsHomeUIView: View {

    @State private var searchText: String = ""
    @StateObject var viewModel: ProductViewModel
    @Environment(\.managedObjectContext) var context

    var body: some View {
    
        NavigationStack {
            VStack {
                SearchBar(text: $searchText)
                    .padding()
                
                HStack {
                    NavigationLink(destination: FilterUIView()) {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(Color(.systemGray2))
                            .font(.system(size: 30))
                    }
                    filterListView()
                }
                .padding()
                
                HStack {
                    Text("Hot Sales")
                        .font(.title3)
                        .bold()
                    Text("See all")
                        .font(.title3)
                        .foregroundColor(Color(.systemGray2))
                        .padding(.leading, 110)
                }
                productsListView()
                
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
                await viewModel.getProductList(url: ApiEndpoint.products, context: context)
            }
            
            Spacer()
        }
        
    }
    
    @ViewBuilder
    func filterListView()-> some View {
        switch viewModel.viewState {
        case .load(products: let products) :
            if products.count > 0 {
                ScrollView(.horizontal) {
                    LazyHStack {
                        
                        // Remove duplicate value from category list
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
                        // loop through category list to display them on the view
                        ForEach(uniqueCategories, id: \.self) { category in
                            Text(category)
                                .background(Color(.white))
                                .padding(9)
                                .foregroundColor(.gray)
                                .overlay(RoundedRectangle(cornerRadius: 15)
                                .stroke(Color(red: 0.66, green: 0.61, blue: 0.99), lineWidth: 2))
                        }
                    }
                }
                .frame(width: 330, height: 50)
            } else {
                Text(NSLocalizedString("loading", comment: ""))
            }
        case .error(message: let message) :
            Text(message)
        case .dbload(dbProducts: let dbProducts):
            if dbProducts.count > 0 {
                Text("DATA category from Database")
            } else {
                Text(NSLocalizedString("loading from Database", comment: ""))
            }
        }
    }
    

    @ViewBuilder
    func productsListView()-> some View {
        
        switch viewModel.viewState {
        case .load(products: let products) :
            if products.count > 0 {
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(products) { product in
                            ProductCellUIView(product: product)
                        }
                    }
                }
            } else {
                Text(NSLocalizedString("loading", comment: ""))
            }
        case .error(message: let message) :
            Text(message)
        case .dbload(dbProducts: let dbProducts):
            if dbProducts.count > 0 {
                
                Text(" DATA from Db")
                
            } else {
                Text(NSLocalizedString("loading from Database", comment: ""))
            }
        }
    }
    
}

struct ProductsHomeUIView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsHomeUIView(viewModel: ProductViewModel())
    }
}
