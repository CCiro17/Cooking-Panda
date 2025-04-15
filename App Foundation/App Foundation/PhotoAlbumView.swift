//
//  PhotoAlbumView.swift
//  App Foundation
//
//  Created by Adriana Palmese on 10/04/25.
//


//
//  PhotoAlbum.swift
//  Cooking Panda
//
//  Created by Adriana Palmese on 10/04/25.
//

import SwiftUI

struct PhotoAlbumView: View {
    let fileManager = FileManager.default
    let directory: URL
    @State private var images: [UIImage] = []
    
    init() {
        self.directory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    var body: some View {
        NavigationStack {
            Text("All of your cooking memories are here!").font(.title2).italic()
            VStack {
                if images.isEmpty {
                    Text("No photos yet!")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 10) {
                            ForEach(images, id: \.self) { image in
                                NavigationLink(destination: FullImageView(image: image)) {
                                    Image(uiImage: image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 100)
                                        .clipped()
                                }

                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Photo Album")
            .onAppear {
                loadImages()
            }
        }
    }
    
    func loadImages() {
        do {
            let fileURLs = try fileManager.contentsOfDirectory(at: directory, includingPropertiesForKeys: nil)
            let imageFiles = fileURLs.filter { $0.pathExtension.lowercased() == "jpg" }
            images = imageFiles.compactMap { url in
                if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                    return image
                }
                return nil
            }
        } catch {
            print("Error loading images: \(error)")
        }
    }
}


#Preview {
    PhotoAlbumView()
}
