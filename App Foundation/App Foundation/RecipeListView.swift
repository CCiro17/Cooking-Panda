//
//  RecipeListView.swift
//  App Foundation
//
//  Created by Adriana Palmese on 11/04/25.
//
import SwiftUI

struct RecipeListView: View {
    @StateObject private var viewModel = RecordsViewModel()
    @State private var isShowingSheet = false
    @State private var selectedRecipe: Fields?
    @State private var searchText: String = ""
    @State private var selectedCategory: String?

    var filteredRecipes: [Record] {
        viewModel.records.filter { record in
            let matchesSearch = searchText.isEmpty || record.fields.Name.localizedCaseInsensitiveContains(searchText)
            let matchesCategory = selectedCategory == nil || record.fields.Category.localizedCaseInsensitiveContains(selectedCategory!)
            return matchesSearch && matchesCategory
        }
    }

    var body: some View {
        NavigationStack {
            VStack {
                // Scroll con panda filtranti per categoria
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        PandaFilterButton(imageName: "PastaPanda", color: .yellow, category: "Pasta", selectedCategory: $selectedCategory)
                        PandaFilterButton(imageName: "SandwichPanda", color: .blue, category: "Chicken", selectedCategory: $selectedCategory)
                        PandaFilterButton(imageName: "PandaSalad", color: .green, category: "Vegan", selectedCategory: $selectedCategory)
                        PandaFilterButton(imageName: "PandaDonut", color: .pink, category: "Dessert", selectedCategory: $selectedCategory)
                    }
                    .padding(.vertical)
                    .padding(.horizontal)
                }

                // Elenco delle ricette
                List {
                    ForEach(filteredRecipes) { record in
                        Button {
                            selectedRecipe = record.fields
                            isShowingSheet = true
                        } label: {
                            VStack(alignment: .leading) {
                                Text(record.fields.Name)
                                    .font(.headline)
                                Text(record.fields.Category)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .listStyle(.plain)
                .searchable(text: $searchText)
                .navigationTitle("All recipes")
            }
            .onAppear {
                viewModel.getData()
            }
            .sheet(isPresented: $isShowingSheet) {
                if let selected = selectedRecipe {
                    RecipeDetailView(fieldData: selected)
                }
            }
        }
    }
}

struct PandaFilterButton: View {
    var imageName: String
    var color: Color
    var category: String
    @Binding var selectedCategory: String?

    var body: some View {
        Button {
            if selectedCategory == category {
                selectedCategory = nil // deseleziona se già selezionata
            } else {
                selectedCategory = category
            }
        } label: {
            Circle()
                .fill(color.opacity(selectedCategory == category ? 1.0 : 0.9))
                .frame(width: 100, height: 100)
                .shadow(radius: 5)
                .overlay(
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 90)
                )
                .overlay(
                    Circle()
                        .stroke(selectedCategory == category ? Color.white : Color.clear, lineWidth: 3)
                )
        }
        .animation(.easeInOut, value: selectedCategory)
    }
}

#Preview {
    RecipeListView()
}

