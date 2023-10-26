//
//  ProductCellUIView.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 24/10/2023.
//

import SwiftUI

struct ProductCellUIView: View {
    
    let product: Product
    
    var body: some View {
        
        
        VStack {
            if let url = URL(string: product.thumbnail){
                ProductAsyncImageView(url: url)
                    .frame(width: 90, height: 90)
                    .mask(RoundedRectangle(cornerRadius: 16))
                    .padding(3)
            } // TODO: -- Add HStack View for the free shipping
            Divider().padding(18)
            Group {
                HStack{
                    Text(product.title)
                    Text("$\(product.price)")
                }
                .font(.callout)
                Text(product.description)
//                    .font(.system(size: 18))
                    .font(.caption)
                    .lineLimit(6)
                    .multilineTextAlignment(.center)
            }.padding(1)
        }
        .background(Color(.systemGray6))
        .cornerRadius(9)
        .frame(width: 180, height: 330)
//        .overlay(RoundedRectangle(cornerRadius: 15)
//        .stroke(Color(red: 0.66, green: 0.61, blue: 0.99), lineWidth: 2))
    }
    
    
    
    
    struct ProductCellUIView_Previews: PreviewProvider {
        static var previews: some View {
            ProductCellUIView(product: Product.getProducts()[1])
        }
    }
}
