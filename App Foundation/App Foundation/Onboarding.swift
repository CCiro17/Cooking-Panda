//
//  Onboarding.swift
//  App Foundation
//
//  Created by Adriana Palmese on 11/04/25.
//

import SwiftUI

struct Onboarding: View {
    @State private var savedName: String = "User"
    @State private var selectedColor: Color = loadColorFromDefaults(key: "savedColor") // inizializzazione con il valore di UserDefaults
    @AppStorage("selectedAvatar") private var selectedAvatar: String = "BearPanda" // Usa AppStorage per tenere traccia della selezione

    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    HStack {
                        VStack {
                            Text("Welcome \(savedName)")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.leading, 40)
                        }
                        .onAppear {
                            if let nome = UserDefaults.standard.string(forKey: "userName") {
                                savedName = nome
                            }
                        }
                        
                        // Button to change name
                        NavigationLink {
                            ChooseName()
                        } label: {
                            Image(systemName: "square.and.pencil")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding(.trailing, 50)
                                .foregroundStyle(.black)
                        }
                    }
                    
                    ZStack {
                        Circle()
                            .fill(.black)
                            .frame(width: 310, height: 310)
                            .shadow(radius: 10)
                            .padding()
                        Circle()
                            .fill(.white)
                            .frame(width: 300, height: 300)
                            .shadow(radius: 10)
                            .padding()
                        Circle()
                            .fill(selectedColor)
                            .frame(width: 290, height: 290)
                            .shadow(radius: 10)
                            .padding()
                        
                        Image(selectedAvatar) // Usa la variabile di AppStorage per l'avatar
                            .resizable()
                            .frame(width: 290, height: 290)
                            .aspectRatio(contentMode: .fill)
                    }
                    
                    // Button to change avatar
                    HStack {
                        ZStack {
                            NavigationLink {
                                changeYourAvatarTwo()
                                } label: {
                            ZStack {
                                Rectangle()
                                    .fill(Color.green)
                                    .opacity(0.8)
                                    .frame(width: 247, height: 68)
                                    .cornerRadius(29).overlay(Text("Change your Avatar")
                                    .font(.title2)
                                    .italic()
                                    .foregroundColor(.black))
                            }
                        }
                    }
                        ColorPicker(" ", selection: $selectedColor)
                            .onChange(of: selectedColor) { newValue in
                                saveColorToDefaults(newValue, key: "savedColor")
                            }

                       
                    }.padding(.all).padding(.trailing, 45).padding(.leading, 40)
                    
                }
                .onAppear {
                    // Carica sempre l'ultimo colore quando la vista appare
                    selectedColor = loadColorFromDefaults(key: "savedColor")
                }
                
                NavigationLink { HomeTabView().navigationBarBackButtonHidden(true) }
                label: {
                    ZStack{
                        Rectangle().fill(Color.orange).opacity(0.8).frame(width: 330, height: 68).cornerRadius(29)
                        Text("Continue").bold().foregroundStyle(.black).font(.title2)
                    }
                }
                
            }
        }
    }
}

#Preview {
    Onboarding()
}
