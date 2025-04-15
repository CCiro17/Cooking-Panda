import SwiftUI

let name: String = "Cucumber salad"
var image: String?

struct Ingredients: Identifiable {
    var ingredient: String
    let id = UUID()
}

private var recipe = [
    Ingredients(ingredient: "2 cups of lettuce"),
    Ingredients(ingredient: "1/2 cucumber, sliced"),
    Ingredients(ingredient: "1/2 avocado, diced"),
    Ingredients(ingredient: "1 tbsp olive oil"),
    Ingredients(ingredient: "1 tsp lemon juice"),
    Ingredients(ingredient: "Q.B. Salt & pepper"),
]

struct RandomRecipeView: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image("CucumberSalad").resizable().frame(width: 327, height: 206).cornerRadius(20).shadow(radius: 10).scaledToFill()
                
                Spacer()
                
                HStack {
                    Image(systemName: "star.fill").symbolEffect(.pulse).symbolRenderingMode(.multicolor)
                    Image(systemName: "star.fill").symbolEffect(.pulse).symbolRenderingMode(.multicolor)
                    Image(systemName: "star.fill").symbolEffect(.pulse).symbolRenderingMode(.multicolor)
                }
                
                Text("Ingredients")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                ScrollView {
                    ForEach(recipe, id: \.id) { ingredient in
                        VStack {
                            Text("\(ingredient.ingredient)")
                        }
                    }
                    
                    Spacer()
                    
                    VStack {
                        NavigationLink(destination: RandomStepsRecipe()) {
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
                        .padding()
                        

                    }
                    
                    Spacer()
                }
            }
            .navigationTitle("Cucumber Salad")
            }
}

#Preview {
    RandomRecipeView()
}
