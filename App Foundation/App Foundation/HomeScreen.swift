import SwiftUI



struct HomeScreen: View {
    @ObservedObject var ViewModel = RecordsViewModel()
    @State private var selectedRecord: Record?
    @State private var navigateToRecipe = false
    
    var body: some View {
        NavigationStack {
                
                    HStack {
                        Text("Home").font(.largeTitle).bold()
                        Spacer()
                    }.padding(.leading, 20)
                                                    
                    Divider()
                    HStack(alignment: .center) {
                        Text("What do you want to cook?")
                            .bold()
                            .padding(.leading, 20)
                        Spacer()
                        NavigationLink(destination: RecipeListView()) {
                            Image(systemName: "chevron.right")
                                .padding(.trailing, 20)
                        }
                    }
                    Divider()
                    
                    Image("Pandavacciuolo")
                        .resizable()
                        .frame(width: 320, height: 450)
                    
                    // Bottone "Surprise me!"
                    NavigationLink { RandomRecipeView() }
                    label: {
                        ZStack{
                            Rectangle().fill(Color.orange).opacity(0.8).frame(width: 330, height: 68).cornerRadius(29)
                            Text("Surprise me!").bold().foregroundStyle(.black).font(.title2)
                        }
                }   }
            }
}

#Preview {
    HomeScreen()
}
