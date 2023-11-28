//
//  ProductsFavoritesUIView.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 25/10/2023.
//

import SwiftUI

struct ProductsFavoritesUIView: View {
    
    @StateObject var viewModel: ProductViewModel
    @Environment(\.managedObjectContext) var context
    
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.favorites) { fav in
                    if let fav = fav.favorite {
                        Text(fav).foregroundColor(fav == "true" ? .red : .black)
                    }
                }
            }
            
        }.task {
            do {
                try await viewModel.getFavoritesList()
            } catch {
                print("Unable to load favorites")
            }
        }
    }
}

struct ProductsFavoritesUIView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsFavoritesUIView(viewModel: ProductViewModel())
    }
}
