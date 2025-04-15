import SwiftUI

struct RecipeDetailView: View {
    var fieldData: Fields
    @Environment(\.dismiss) var dismiss
    @State private var recipeImage: UIImage?

    func loadImageFromURL() {
        guard let url = fieldData.ImageLink else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data, let uiImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.recipeImage = uiImage
                }
            }
        }.resume()
    }

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                ZStack {
                    if let image = recipeImage {
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 327, height: 206)
                            .cornerRadius(20)
                            .shadow(radius: 10)
                    } else {
                        Rectangle()
                            .fill(Color.green)
                            .frame(width: 327, height: 206)
                            .cornerRadius(20)
                            .opacity(0.3)
                            .shadow(radius: 10)
                        
                        Image(systemName: "photo")
                            .resizable()
                            .frame(width: 52, height: 52)
                            .scaledToFit()
                            .padding()
                            .opacity(0.8)
                    }
                }
                
                Spacer()
                
                HStack {
                    Image(systemName: "star.fill").symbolEffect(.pulse).symbolRenderingMode(.multicolor)
                    Image(systemName: "star.fill").symbolEffect(.pulse).symbolRenderingMode(.multicolor)
                    Image(systemName: "star.fill").symbolEffect(.pulse).symbolRenderingMode(.multicolor)
                }
                
                Text("Ingredients")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                
                ScrollView {
                    ForEach(fieldData.ingredientsArray, id: \.self) { ingredient in
                        Text(ingredient)
                            .padding(.vertical, 4)
                    }
                }
                    Spacer()
                    
                    VStack {
                        NavigationLink(destination: StepsRecipe(recipeName: fieldData.Name, instructions: fieldData.instructionsArray)) {
                            Text("Let's start!")
                                .fontWeight(.bold)
                                .font(.headline)
                                .foregroundColor(.black)
                                .italic()
                                .padding()
                                .frame(width: 200)
                                .background(Color.green.opacity(0.3))
                                .cornerRadius(10)
                                .opacity(0.8)
                                .shadow(radius: 5)
                        }
                        .padding()
                    }
                
            }
            .navigationTitle(fieldData.Name)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        dismiss()
                    }){
                        Image(systemName: "x.circle.fill")
                            .foregroundStyle(.red)
                    }
                }
            }
            .onAppear {
                loadImageFromURL()
            }
        }
    }
}
