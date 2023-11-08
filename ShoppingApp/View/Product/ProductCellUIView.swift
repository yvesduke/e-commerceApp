//
//  ProductCellUIView.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 24/10/2023.
//

import SwiftUI

struct ProductCellUIView: View {

    let product: Product?
    let dbProduct: ProductEntity?

    var body: some View {
        
        VStack {
            
            if let img = product?.thumbnail {
                if let url = URL(string: img){
                    ProductAsyncImageView(url: url)
                        .frame(width: 90, height: 90)
                        .mask(RoundedRectangle(cornerRadius: 16))
                        .padding(3)
                } // TODO: -- Add HStack View for the free shipping
            } else if let img = dbProduct?.thumbnail {
                if let url = URL(string: img){
                    ProductAsyncImageView(url: url)
                        .frame(width: 90, height: 90)
                        .mask(RoundedRectangle(cornerRadius: 16))
                        .padding(3)
                } 
            }
            // TODO: -- Add HStack View for the free shipping
            Divider()
                .padding(18)
                HStack{
                    Text((product?.title ?? dbProduct?.title) ?? "")
                    Text(""+"\(product?.price ?? Int(dbProduct?.price ?? 0))")
                }
                .font(.callout)
            Text((product?.description ?? dbProduct?.description) ?? "")
                    .font(.caption)
                    .lineLimit(6)
                    .multilineTextAlignment(.center)
        }
        .background(Color(.systemGray6))
        .cornerRadius(9)
        .frame(width: 180, height: 330)
    }

    struct ProductCellUIView_Previews: PreviewProvider {
        static var previews: some View {
            ProductCellUIView(product: nil, dbProduct: nil)
        }
    }
}
