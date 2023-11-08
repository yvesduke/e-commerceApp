//
//  SearchBar.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 25/10/2023.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    @StateObject var viewModel: ProductViewModel
        
    var body: some View {
        
        ZStack {
            TextField("Search", text: $text)
                .padding(12)
                .padding(.horizontal, 0)
                .background(Color(.systemGray6))
                .cornerRadius(18)
            Image(systemName: "magnifyingglass")
                .padding(.leading, 280) // TODO: -- Use the right aproach for this one
                .foregroundColor(.gray)
        }
        
        NavigationStack {
            List {
                ForEach(viewModel.filteredProducts) { product in
                    Text(product.title)
                }
                .listRowSeparator(.hidden, edges: .all)
            }
            .listStyle(.plain)
            .navigationTitle("Find your next Product")
            .searchable(text: $viewModel.searchText)
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""), viewModel: ProductViewModel())
    }
}