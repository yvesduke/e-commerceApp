//
//  ProductDetailUIView.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 24/10/2023.
//

import SwiftUI

struct ProductDetailUIView: View {
    
    let product: Product?
    let dbProduct: ProductEntity?
    @Binding var coupon: String
    @State private var isFavorites = false
    @State private var FavColor: Color = .purple
    @ObservedObject private var cartVm = CartViewModel()
    @StateObject var productVm: ProductViewModel
    
    
    var body: some View {
        
        NavigationStack {
            
            Text("Details Product").font(.largeTitle).foregroundColor(.purple)
            VStack {
                if let imgs = product?.images {
                    ImageGalleryView(images: imgs)
                } else if let imgs = dbProduct?.images {
                    ImageGalleryView(images: imgs)
                }
                Divider()
                    .padding(18)
                Group {
                    HStack{
                        Text("Free shipping")
                            .padding(.trailing, 100)
                            .foregroundColor(.white).background(Color.green).padding(6)
                            .cornerRadius(9)
                        
                        Image(systemName: "heart.fill")
                            .padding(.leading, 100)
                            .foregroundColor(FavColor)
                            .onTapGesture {
                                print("Added to Fav or Removed to Fav")
                                self.isFavorites.toggle()
                                
                                if isFavorites {
                                    self.FavColor = .red
                                    if let dbProduct = dbProduct {
                                        Task {
                                            do {
                                                try await productVm.addToFavorites(product: dbProduct)
                                            } catch {
                                                print("Error adding to favorites: \(error)")
                                            }
                                        }
                                    } else if let product = product {
//                                        Task {
//                                            do {
//                                                try await productVm.addToFavorites(product: product as)
//
//                                            } catch {
//                                                print("Error adding to favorites: \(error)")
//                                            }
//                                        }
                                        print("Handle Api response Products")
                                    }
                                } else {
                                    self.FavColor = .purple
                                }
                            }
                    }
                    
                    Text(product?.title ?? dbProduct?.title ?? "").font(.title).foregroundColor(.purple)
                    Text(product?.description ?? dbProduct?.descriptions ?? "")
                        .font(.callout)
                        .lineLimit(9)
                        .multilineTextAlignment(.center)
                    Group {
                        HStack {
                            Text("$"+"\(product?.price ?? Int(dbProduct?.price ?? 0))")
                                .padding(.trailing, 100)
                            Image(systemName: "moonphase.full.moon.inverse")
                                .padding(.leading, 100)
                            Image(systemName: "moonphase.new.moon.inverse")
                                .padding(.leading, 1)
                            Image(systemName: "moonphase.new.moon.inverse")
                                .padding(.leading, 1)
                        }
                        
                        HStack {
                            Image(systemName: "person.3.sequence")// person.3.sequence.fill, person.3.sequence, person.3.fill, person.3, person.icloud, person.icloud.fill
                                .foregroundColor(.purple)
                            Text("8,200+ people pinned this")
                                .font(.caption)
                                .padding(.trailing, 150)
                        }
                        HStack{
                            Text("Have a coupon code? enter here")
                                .font(.caption2)
                            Image(systemName: "hand.point.down") //hand.point.down, hand.point.down.fill
                                .padding(.trailing, 150)
                        }
                    }
                    
                    ZStack {
                        TextField("AXDSFR", text: $coupon)
                            .padding(12)
                            .padding(.horizontal, 0)
                            .background(Color(.systemGray6))
                            .cornerRadius(18)
                        Text("Available").foregroundColor(.green) // UIColor(red:
                            .padding(.leading, 150)
                        Image(systemName: "checkmark.circle.fill") // checkmark, xmark.circle.fill
                            .padding(.leading, 280)
                            .foregroundColor(.green)
                    }
                    .overlay(RoundedRectangle(cornerRadius: 9)
                        .stroke(Color(red: 0.80, green: 0.82, blue: 0.83), lineWidth: 2))
                    
                    Group {
                        HStack {
                            //Decrease cart amount button
                            Button(action: {
                                print("Decrease Cart amount")
                                cartVm.Qty -= 1
                            }) {
                                Text("-")
                                    .frame(width: 6, height: 6)
                                    .padding()
                                    .foregroundColor(Color.green)
                            }
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(6)
                            .overlay(
                                RoundedRectangle(cornerRadius: 9)
                                    .stroke(Color.green, lineWidth: 3)
                            )
                            
                            // Cart amount value
                            Text("\(cartVm.Qty)").font(.caption)
                            
                            //Increase cart amount button
                            Button(action: {
                                print("Increase Cart amount")
                                cartVm.Qty += 1
                            }) {
                                Text("+")
                                    .frame(width: 6, height: 6)
                                    .padding()
                            }
                            .background(Color.green.opacity(0.9))
                            .cornerRadius(6)
                            .overlay(
                                RoundedRectangle(cornerRadius: 9)
                                    .stroke(Color.green, lineWidth: 3)
                            )
                            
                            // Continue Button
                            Button(action: {
                                if let product = product {
                                    cartItems.append(product)
                                } else if let dbProduct = dbProduct {
                                    let product = Product(id: Int(dbProduct.id), title: dbProduct.title!, description: dbProduct.description, price: Int(dbProduct.price), discountPercentage: dbProduct.discountPercentage, rating: dbProduct.rating, stock: Int(dbProduct.stock), brand: dbProduct.brand!, category: dbProduct.category!, thumbnail: dbProduct.thumbnail!, images: dbProduct.images!)
                                    cartItems.append(product)
                                }
                            }) {
                                Text(NSLocalizedString("Add to Cart", comment: ""))
                                    .frame(width: 120, height: 15)
                                    .padding()
                                    .foregroundColor(.white)
                                //Image(systemName: "cart.badge.plus")
                            }
                            .background(Color.green)
                            .cornerRadius(12)
                            .padding(.leading, 100)
                        }
                    }
                }
                .padding(1)
            }
            .background(Color(.systemGray6))
            .cornerRadius(9)
            .frame(width: 360, height: 600)
            .toolbarBackground(Color(red: 0.66, green: 0.61, blue: 0.99), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

struct ProductDetailUIView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailUIView(product: nil, dbProduct: nil, coupon: .constant(""), productVm: ProductViewModel())
    }
}
