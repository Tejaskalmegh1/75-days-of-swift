// Day 69: Image Loading & Caching
// Topic: AsyncImage + Basic Cache

import SwiftUI

class ImageCache {
    static let shared = NSCache<NSString, NSData>()
}

struct CachedAsyncImage: View {
    
    let url: URL?
    
    @State private var imageData: Data?
    
    var body: some View {
        
        if let data = imageData,
           let uiImage = UIImage(data: data) {
            
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
            
        } else {
            
            ProgressView()
                .onAppear {
                    loadImage()
                }
        }
    }
    
    func loadImage() {
        guard let url = url else { return }
        
        let key = url.absoluteString as NSString
        
        if let cachedData = ImageCache.shared.object(forKey: key) {
            self.imageData = cachedData as Data
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            
            ImageCache.shared.setObject(data as NSData, forKey: key)
            
            DispatchQueue.main.async {
                self.imageData = data
            }
        }.resume()
    }
}