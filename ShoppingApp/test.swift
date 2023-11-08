//import SwiftUI
//
//struct ImageGalleryView: View {
//    let images: [String] // Replace with your image array
//
//    @State private var currentIndex: Int = 0
//
//    var body: some View {
//        NavigationView {
//            HStack {
//                mainImageView
//                thumbnailListView
//            }
//            .navigationTitle("Image Gallery")
//        }
//    }
//
//    private var mainImageView: some View {
//        Image(images[currentIndex])
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//    }
//
//    private var thumbnailListView: some View {
//        ScrollView(.vertical) {
//            LazyVStack(spacing: 10) {
//                ForEach(images.indices, id: \.self) { index in
//                    thumbnailView(for: index)
//                }
//            }
//        }
//        .frame(width: 100)
//    }
//
//    private func thumbnailView(for index: Int) -> some View {
//        let imageName = images[index]
//        return Image(imageName)
//            .resizable()
//            .aspectRatio(contentMode: .fill)
//            .frame(width: 80, height: 80)
//            .cornerRadius(8)
//            .onTapGesture {
//                currentIndex = index
//            }
//    }
//}
//
//struct ImageGalleryView_Previews: PreviewProvider {
//    static var previews: some View {
//        let images = ["image1", "image2", "image3"] // Add your image names here
//        return ImageGalleryView(images: images)
//    }
//}
//
