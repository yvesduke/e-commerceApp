//
//  FeedAsyncImageView.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 19/10/2023.
//

import Foundation

import SwiftUI

struct FeedAsyncImageView: View {
    
    let url: URL
    private let imageWidth = 150.0
    private let cellHeight = 150.0
    
    var body: some View {
        CacheAsyncImage(
            url: url) { phase in
                switch phase {
                case .success(let image):
                    VStack {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: imageWidth)
                            .padding(.trailing, 10)
                        Spacer()
                    }
                case .failure(let error):
                    Text(error.localizedDescription)
                case .empty:
                    HStack(alignment: .center) {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .red))
                        Spacer()
                    }
                @unknown default:
                    Image(systemName: "questionmark")
                }
            }
    }
}

struct FeedAsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        FeedAsyncImageView(url: URL(string: "https://images.unsplash.com/profile")!)
    }
}
