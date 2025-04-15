import SwiftUI

var starCount: Int = 3

struct Shop: View {
    
    var body: some View {
        NavigationStack {
            VStack() {
                HStack {
                    Text("Shop").font(.largeTitle).bold()
                    Spacer()
                }.padding(.leading, 20)
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("You have \(starCount) stars!")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                    }
                    VStack(alignment: .leading) {
                        Image("PandaMoney")
                            .resizable().scaledToFill()
                            .frame(width: 100, height: 100)
                    }
                }
                .padding()
                .background(Color.orange)
                .cornerRadius(15)
                .padding(.horizontal)
                
                Spacer()
                
                // Prima card direttamente qui
                HStack{
                    Image("PandaClaus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60).clipShape(Circle())
                    VStack(alignment: .leading, spacing: 5) {
                        Text("PandaClaus")
                            .font(.headline)
                        ForEach(["Pandoro", "Struffoli", "Roccocò"], id: \.self) { dish in
                            Text(dish)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Spacer()
                    VStack(alignment: .center, spacing: 2) {
                        if starCount < 15 {
                            Text("Stars needed: 15").font(.subheadline)
                                .foregroundColor(.gray)
                            Text("Stars Left: \(15 - starCount)").font(.subheadline)
                                .foregroundColor(.gray)
                        } else {
                            Text("Unlocked!").font(.subheadline)
                                .foregroundColor(.black).bold()
                        }
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(width: 350, height: 100)
                
                
                Spacer()
                
                // Seconda card direttamente qui
                HStack{
                    Image("BunnyPanda")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60).clipShape(Circle())
                    VStack(alignment: .leading, spacing: 5) {
                        Text("BunnyPanda")
                            .font(.headline)
                        ForEach(["Migliaccio", "Pastiera", "Casatiello"], id: \.self) { dish in
                            Text(dish)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Spacer()
                    VStack(alignment: .center, spacing: 2) {
                        if starCount < 20 {
                            Text("Stars needed: 20").font(.subheadline)
                                .foregroundColor(.gray)
                            Text("Stars Left: \(20 - starCount)").font(.subheadline)
                                .foregroundColor(.gray)
                        } else {
                            Text("Unlocked!").font(.subheadline)
                                .foregroundColor(.black).bold()
                        }
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(width: 350, height: 100)
                

            
                Spacer()
                
                // Terza card direttamente qui
                HStack{
                    Image("CarnivalPanda")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60).clipShape(Circle())
                    VStack(alignment: .leading, spacing: 5) {
                        Text("CarnivalPanda")
                            .font(.headline)
                        ForEach(["Chiacchiere", "Graffe", "Sanguinaccio"], id: \.self) { dish in
                            Text(dish)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Spacer()
                    VStack(alignment: .center, spacing: 2) {
                        if starCount < 20 {
                            Text("Stars needed: 20").font(.subheadline)
                                .foregroundColor(.gray)
                            Text("Stars Left: \(20 - starCount)").font(.subheadline)
                                .foregroundColor(.gray)
                        } else {
                            Text("Unlocked!").font(.subheadline)
                                .foregroundColor(.black).bold()
                        }
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(width: 350, height: 100)
                
                Spacer()
                Spacer()
                
            }
        }
    }
}

#Preview {
    Shop()
}
