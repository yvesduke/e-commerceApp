//
//  ProductsHomeUIView.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 25/10/2023.
//

import SwiftUI

struct ProductsHomeUIView: View {

    @StateObject var viewModel: ProductViewModel
    @Environment(\.managedObjectContext) var context

    var body: some View {
    
        NavigationStack {
            ZStack(alignment: .topLeading) {
                
                VStack {
                    HStack {
                        NavigationLink(destination: FilterUIView()) {
                            Image(systemName: "slider.horizontal.3")
                                .foregroundColor(Color(.systemGray2))
                                .font(.system(size: 30))
                        }
                        filterListView()
                    }
                    HStack {
                        Text("Hot Sales")
                            .font(.title3)
                            .bold()
                            .padding(.trailing, 100)
                        Text("See all")
                            .font(.title3)
                            .foregroundColor(Color(.systemGray2))
                            .padding(.leading, 100)
                    }
                    .searchable(text: .constant(""))
                    productsListView()
                    HStack {
                        Text("Viewed")
                            .font(.title3)
                            .bold()
                            .padding(.trailing, 100)
                        Text("See all")
                            .font(.title3)
                            .foregroundColor(Color(.systemGray2))
                            .padding(.leading, 100)
                    }
                    productsListView()
                }
                VStack {
                    SearchBar(text: $viewModel.searchText, viewModel: viewModel)
                }
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
                        let Catproduct = viewModel.removeDuplicates(category: products)
                        
                        ForEach(Catproduct, id: \.self) { category in
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
                
                ScrollView(.horizontal) {
                    LazyHStack {
                        let Catproduct = viewModel.removeDuplicates(category: dbProducts)
                        
                        ForEach(Catproduct, id: \.self) { category in
                            Text(category)
                                .background(Color(.white))
                                .padding(9)
                                .foregroundColor(.gray)
                                .overlay(RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color(red: 0.66, green: 0.61, blue: 0.99), lineWidth: 2))
                        }
                    }
                }
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
                            NavigationLink {
                                ProductDetailUIView(product: product, dbProduct: nil, coupon: .constant(""), productVm: ProductViewModel())
                            } label: {
                                ProductCellUIView(product: product, dbProduct: nil)
                            }
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
                ScrollView(.horizontal){
                    LazyHStack {
                        ForEach(dbProducts) { dbproduct in
                            NavigationLink {
                                ProductDetailUIView(product: nil, dbProduct: dbproduct, coupon: .constant(""), productVm: ProductViewModel())
                            } label: {
                                ProductCellUIView(product: nil, dbProduct: dbproduct )
                            }
                        }
                    }
                }
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
