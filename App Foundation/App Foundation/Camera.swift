import SwiftUI

struct CameraView: View {
    @State private var showImagePicker = false
    @State private var image: UIImage?
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    
    // Funzione per salvare l'immagine su file
    func saveImageToDocuments(image: UIImage) -> URL? {
        guard let data = image.jpegData(compressionQuality: 1) else {
            return nil
        }
        let fileManager = FileManager.default
        let directory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = directory.appendingPathComponent("recipe_image.jpg")
        
        do {
            try data.write(to: fileURL)
            return fileURL
        } catch {
            print("Error saving image: \(error)")
            return nil
        }
    }
    
    // Funzione per salvare l'immagine nell'album fotografico
    func saveImageToPhotoAlbum() {
        guard let image = image else { return }
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }

    var body: some View {
        VStack(spacing: 20) {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 8)
                
                // Salviamo l'immagine quando viene scattata
                if let savedURL = saveImageToDocuments(image: image) {
                    // Passa l'URL dell'immagine alla schermata principale
                    Text(" ")
                }
                
                // Pulsante per salvare l'immagine nell'album fotografico
                Button("Save to Photo Album") {
                    saveImageToPhotoAlbum()
                }
                .font(.headline)
                .foregroundColor(.black)
                .italic()
                .padding()
                .background(Color.blue.opacity(0.3))
                .cornerRadius(10)

            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.4))
                    .frame(height: 300)
                    .cornerRadius(20)
                    .opacity(0.3)
                    .buttonBorderShape(.roundedRectangle(radius: 20))
                    .shadow(radius: 5)
                    .overlay(Text("No image yet").foregroundColor(.gray))
            }

            Spacer()

            Button("Open Camera") {
                sourceType = .camera
                showImagePicker.toggle()
            }
            .font(.headline)
            .foregroundColor(.black)
            .italic()
            .padding()
            .background(Color.green.opacity(0.3))
            .cornerRadius(10)

            Button("Choose from Gallery") {
                sourceType = .photoLibrary
                showImagePicker.toggle()
            }
            .font(.headline)
            .foregroundColor(.black)
            .italic()
            .padding()
            .background(Color.green.opacity(0.3))
            .cornerRadius(10)

            Spacer()
        }
        .padding()
        .navigationTitle("Camera")
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(sourceType: sourceType, selectedImage: $image)
        }
    }
}

#Preview {
    CameraView()
}
