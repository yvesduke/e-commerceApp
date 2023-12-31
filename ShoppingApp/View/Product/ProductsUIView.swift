//
//  ProductsUIView.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 24/10/2023.
//

import SwiftUI

struct ProductsUIView: View {
    
    @StateObject private var productVm = ProductViewModel()
    @StateObject private var cartVm = CartViewModel()
    
    
    enum Tab: Int {
        case home
        case cart
        case favorites
        case profile
    }
    
    @State private var selection: Tab = .home

    var body: some View {

        TabView {
            NavigationStack {
                ProductsHomeUIView(viewModel: productVm)
            }
            .tabItem {
                Label("Products", systemImage: "list.bullet")
            }
            .toolbarBackground(Color(red: 0.66, green: 0.61, blue: 0.99), for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
            .tag(Tab.home)
            
            ProductsCartUIView(cartVm: cartVm).tabItem {
                Image(systemName: "cart")
                Text(" Cart")
//                Label("Cart",systemImage: cartItems.count == 0 ? "cart" : "cart.badge.plus")
            }
            .toolbarBackground(Color(red: 0.66, green: 0.61, blue: 0.99), for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
            .tag(Tab.cart)
            
            ProductsFavoritesUIView(viewModel: productVm).tabItem {
                Image(systemName: "heart")
                Text("Favorites")
            }
            .toolbarBackground(Color(red: 0.66, green: 0.61, blue: 0.99), for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
            .tag(Tab.favorites)
            
            ProductsProfileUIView().tabItem {
                Image(systemName: "person")
                Text("Profiles")
            }
            .toolbarBackground(Color(red: 0.66, green: 0.61, blue: 0.99), for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
            .tag(Tab.profile)
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
