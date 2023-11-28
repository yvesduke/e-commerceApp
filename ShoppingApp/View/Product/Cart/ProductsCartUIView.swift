//
//  ProductsCartUIView.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 25/10/2023.
//

import SwiftUI

struct ProductsCartUIView: View {
    
    @State var totalPrice = 0
    @ObservedObject var cartVm: CartViewModel
    
    var body: some View {
        VStack {
            List {
                ForEach(cartItems) { cartItem in
                    HStack {
                        if let img = URL(string: cartItem.thumbnail) {
                            ProductAsyncImageView(url: img)
//                                .frame(width: 60, height: 60)
                        }

                        VStack(alignment: .leading) {
                            Text(cartItem.title).fontWeight(.semibold)
                            Text("$\(cartItem.price)")
                        }
                        Spacer()
                        Text("Qty: \(cartVm.Qty)")
                    }

                }.onDelete {indexSet in
                    cartItems.remove(atOffsets: indexSet)
                    self.calculateTotalPrice()
                }
            }
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.purple)
                        .opacity(0.8)
                        .frame(width: 350, height: 120)
                    VStack {
                        Text("Total Price")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .frame(width: 350, alignment: .leading)
                            .padding(.leading, 60)
                        Text("$\(totalPrice)")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .bold))
                            .frame(width: 350, alignment: .leading)
                            .padding(.leading, 60)
                    }
                    Button() {
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder()
                                .frame(width: 120, height: 50)
                                .foregroundColor(.white)
                            Text("Pay Now >")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }.offset(x: 80)
                }.padding()
           
        }.onAppear(perform: self.calculateTotalPrice)
        
    }
    func calculateTotalPrice() {
        totalPrice = 0
        for i in 0..<cartItems.count {
            totalPrice += cartItems[i].price
        }
    }
    
}

struct ProductsCartUIView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsCartUIView(cartVm: CartViewModel())
    }
}
