//
//  ProductsUIView.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 24/10/2023.
//

import SwiftUI

struct ProductsUIView: View {

    var body: some View {

        TabView {
            NavigationStack {
                ProductsHomeUIView(viewModel: ProductViewModel())
            }
            .tabItem {
                Label("Products", systemImage: "list.bullet")
            }
            .toolbarBackground(Color(red: 0.66, green: 0.61, blue: 0.99), for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
            
            ProductsCartUIView().tabItem{
                Image(systemName: "cart")
                Text(" Cart")
            }
            .toolbarBackground(Color(red: 0.66, green: 0.61, blue: 0.99), for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
            
            ProductsFavoritesUIView().tabItem {
                Image(systemName: "heart")
                Text("Favorites")
            }
            .toolbarBackground(Color(red: 0.66, green: 0.61, blue: 0.99), for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
            
            ProductsProfileUIView().tabItem {
                Image(systemName: "person")
                Text("Profiles")
            }
            .toolbarBackground(Color(red: 0.66, green: 0.61, blue: 0.99), for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
        }
        .toolbarBackground(Color(red: 0.66, green: 0.61, blue: 0.99), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

struct ProductsUIView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsUIView()
    }
}
