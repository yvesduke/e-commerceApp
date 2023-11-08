//
//  ImageGalleryView.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 07/11/2023.
//

import SwiftUI

struct ImageGalleryView: View {
    
    let images: [String]
    
    @State private var currentIndex: Int = 0
    

    var body: some View {
        
        NavigationStack {
            HStack {
                mainImageView
                thumbnailListView
            }
        }
        
    }
    
    private var mainImageView: some View {
        ProductAsyncImageView(url: URL(string: images[currentIndex])!) // Handle this properly don't force unwrap
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .clipped()
    }
    
    private var thumbnailListView: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 10) {
                ForEach(images.indices, id: \.self) { index in
                    thumbnailView(for: index)
                }
            }
        }
        .frame(width: 100)
    }
    
    private func thumbnailView(for index: Int) -> some View {
        let imageName = images[index]
        return ProductAsyncImageView(url: URL(string: imageName)!)
            .aspectRatio(contentMode: .fill)
            .frame(width: 50, height: 50)
            .cornerRadius(8)
            .onTapGesture {
                currentIndex = index
            }
    }
    
    
}

