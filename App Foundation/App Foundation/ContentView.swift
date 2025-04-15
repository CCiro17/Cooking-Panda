//
//  ContentView.swift
//  App Foundation
//
//  Created by Fabio Fontana on 09/04/25.
//

import SwiftUI

struct ContentView: View {
  
    @StateObject private var viewModel = RecordsViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.records) { record in
                VStack(alignment: .leading, spacing: 5) {
                    Text(record.fields.Name)
                        .font(.headline)
                    
                    Text(record.fields.Category)
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    
                    ForEach(record.fields.instructionsArray, id: \.self) { instruction in
                                         Text(instruction)
                                             .font(.subheadline)
                                             .foregroundColor(.gray)
                                     }
                    
                    ForEach(record.fields.ingredientsArray, id: \.self) { ingredient in
                                         Text(ingredient)
                                             .font(.subheadline)
                                             .foregroundColor(.gray)
                                     }
                    
                    // Display the image using AsyncImage
                    if let imageLink = record.fields.ImageLink {
                        AsyncImage(url: imageLink) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200) // Adjust the size as necessary
                        } placeholder: {
                            ProgressView() // Show a loading indicator while the image is downloading
                                .progressViewStyle(CircularProgressViewStyle())
                        }
                    } else {
                        Text("No image available") // In case the ImageLink is nil
                            .foregroundColor(.gray)
                    }
                }
                .padding()
            }
            .navigationTitle("Recipes")
            .onAppear {
                viewModel.getData()
            }
        }
    }
}

#Preview {
    ContentView()
}
