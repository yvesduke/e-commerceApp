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
    
    var body: some View {
        Text("Details Product").font(.largeTitle).foregroundColor(.purple)
        VStack {
            
//            ImageGalleryView()
            if let imgs = product?.images {
                ImageGalleryView(images: imgs)
            }
            
            
//            if let img = product?.thumbnail {
//                if let url = URL(string: img){
//                    ProductAsyncImageView(url: url)
////                        .frame(width: 90, height: 90)
//                        .mask(RoundedRectangle(cornerRadius: 16))
//                        .padding(3)
//                }
//            }
            Divider()
                .padding(18)
            Group {
                HStack{
                    Text("Free shipping")
                        .padding(.trailing, 100)
                        .foregroundColor(.white).background(Color.green).padding(6)
//                        .foregroundColor(.white).background(Color(red: 0.74, green: 0.92, blue: 0.87)).padding(6)//UIColor(red: 0.74, green: 0.92, blue: 0.87, alpha: 1.00)
                        .cornerRadius(9)
                         
                    Image(systemName: "heart")
                        .padding(.leading, 100)
                }
                Text(product?.title ?? "").font(.title2)
                Text(product?.description ?? "")
                    .font(.callout)
                    .lineLimit(9)
                    .multilineTextAlignment(.center)
                HStack {
                    Text("$"+"\(product?.price ?? 0)")
                        .padding(.trailing, 100)
                    Image(systemName: "moonphase.full.moon.inverse") //moonphase.new.moon.inverse, poweroff, moonphase.full.moon.inverse
                        .padding(.leading, 100)
                    Image(systemName: "moonphase.new.moon.inverse")
                        .padding(.leading, 1)
                    Image(systemName: "moonphase.new.moon.inverse")
                        .padding(.leading, 1)
                }
                
                HStack {
                    Image(systemName: "")
                    Text("8,200+ people pinned this")
                        .font(.caption)
                }
                HStack{
                    Text("Have a coupon code? enter here")
                        .font(.caption2)
                    Image(systemName: "hand.point.down") //hand.point.down, hand.point.down.fill
                }
                ZStack{
                    TextField("AXDSFR", text: $coupon)
                        .padding(12)
                        .padding(.horizontal, 0)
                        .background(Color(.systemGray6))
                        .cornerRadius(18)
                    Text("Available").foregroundColor(.green) // UIColor(red: 0.74, green: 0.92, blue: 0.87, alpha: 1.00)
//                    Text("Available").foregroundColor(Color(red: 0.74, green: 0.92, blue: 0.87))
                        .padding(.leading, 150)
                    Image(systemName: "checkmark.circle.fill") // checkmark, xmark.circle.fill
                        .padding(.leading, 280)
                        .foregroundColor(.green) // UIColor(red: 0.74, green: 0.92, blue: 0.87, alpha: 1.00)
//                        .foregroundColor(Color(red: 0.74, green: 0.92, blue: 0.87, alpha: 1.00))
                }
                .overlay(RoundedRectangle(cornerRadius: 9)
                    .stroke(Color(red: 0.80, green: 0.82, blue: 0.83), lineWidth: 2))
                
                Group {
                    HStack {
                        //Decrease cart amount button
                        Button(action: {
                                print("Decrease Cart amount")
                            }) {
                                Text("-")
                                    .frame(width: 6, height: 6)
                                    .padding()
                                    .foregroundColor(Color.green) // UIColor(red: 0.74, green: 0.92, blue: 0.87, alpha: 1.00)
//                                    .foregroundColor(Color(red: 0.74, green: 0.92, blue: 0.87))
                            }
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(6)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.green, lineWidth: 3)
                        )
                        
                        // Cart amount value
                        Text("1")
                        
                        //Increase cart amount button
                        Button(action: {
                                print("Increase Cart amount")
                            }) {
                                Text("+")
                                    .frame(width: 6, height: 6)
                                    .padding()
                            }
                            .background(Color.green.opacity(0.9)) // UIColor(red: 0.74, green: 0.92, blue: 0.87, alpha: 1.00)
//                            .background(Color(red: 0.74, green: 0.92, blue: 0.87).opacity(0.9))
                            .cornerRadius(6)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.green, lineWidth: 3) // UIColor(red: 0.74, green: 0.92, blue: 0.87, alpha: 1.00)
//                                    .stroke(Color(red: 0.74, green: 0.92, blue: 0.87), lineWidth: 3)
                        )
                        
                        // Continue Button
                        Button(action: {
                            print("Continue to Cart button pressed!")
                        }) {
                            Text(NSLocalizedString("Continue", comment: ""))
                                .frame(width: 120, height: 15)
                                .padding()
                                .foregroundColor(.white)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 30)
//                                        .stroke(Color.white, lineWidth: 3)
//                                )
                        }
                        .background(Color.green) // UIColor(red: 0.74, green: 0.92, blue: 0.87, alpha: 1.00)
//                        .background(Color(red: 0.74, green: 0.92, blue: 0.87))
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
    }
    
}

struct ProductDetailUIView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailUIView(product: nil, dbProduct: nil, coupon: .constant(""))
    }
}
