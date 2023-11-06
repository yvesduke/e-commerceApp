//
//  ProductCellUIView.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 24/10/2023.
//

import SwiftUI

struct ProductCellUIView: View {

    let product: Product
    let dbProduct: ProductEntity?

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
                    .font(.caption)
                    .lineLimit(6)
                    .multilineTextAlignment(.center)
            }.padding(1)
        }
        .background(Color(.systemGray6))
        .cornerRadius(9)
        .frame(width: 180, height: 330)
    }

    struct ProductCellUIView_Previews: PreviewProvider {
        static var previews: some View {
            ProductCellUIView(product: Product.getProducts()[1], dbProduct: nil)
        }
    }
}
