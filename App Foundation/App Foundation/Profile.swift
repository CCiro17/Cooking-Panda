//
//  Profile.swift
//  App Foundation
//
//  Created by Adriana Palmese on 11/04/25.
//

import SwiftUI

struct Profile: View {
    @State private var savedName: String = "User"
    @State private var selectedColor: Color = .white // valore di default
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
                            .animation(.easeInOut(duration: 0.3), value: selectedAvatar)
                    }
                    
                    // Button to change avatar
                    HStack {
                        ZStack {
                            NavigationLink {
                                changeYourAvatar()
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
                       
                    }.padding(.all).padding(.trailing, 45).padding(.leading, 40)
                    
                    NavigationLink {
                        PhotoAlbumView()
                    } label:{
                        ZStack {
                            Rectangle()
                                .fill(Color.yellow)
                                .opacity(0.8)
                                .frame(width: 367, height: 68)
                                .cornerRadius(29)
                            Text("Your Photo Album")
                                .font(.title)
                                .italic()
                                .foregroundColor(.black)
                        }
                    }
                }
                .onAppear {
                        selectedColor = loadColorFromDefaults(key: "savedColor")
                }
            }.navigationTitle("Profile")
        }
    }
}

#Preview {
    Profile()
}
