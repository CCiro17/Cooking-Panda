//
//  Archievement.swift
//  App Foundation
//
//  Created by Fabio Fontana on 10/04/25.
//


//
//  Archievement.swift
//  Cooking Panda
//
//  Created by Adriana Palmese on 10/04/25.
//

import SwiftUI

struct Archievement: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Achievements")
                    .font(.title)
                    .fontWeight(.bold)
                HStack {
                    Circle()
                        .fill(Color.pink).opacity(0.7)
                        .frame(width: 160, height: 160).shadow(radius: 5).overlay(
                            VStack {
                                Image(systemName: "medal.fill").resizable().frame(width: 60, height: 70).foregroundColor(.white)
                                Text("You have finished your first\nrecipe!").font(.footnote).foregroundColor(.white).multilineTextAlignment(.center).bold()
                            })
                    Circle()
                        .fill(Color.gray).opacity(1)
                        .frame(width: 160, height: 160).shadow(radius: 5).overlay(
                            VStack {
                                Text("You do not have completed\nall the recipes\n yet!").font(.footnote).foregroundColor(.white).multilineTextAlignment(.center).bold()
                            })
                }.padding()
                
                HStack{
                    Circle()
                        .fill(Color.gray).opacity(0.8)
                        .frame(width: 160, height: 160).shadow(radius: 5).overlay(
                            VStack {
                                Text("You do not have completed 5\n3-stars-recipes\n yet!").font(.footnote).foregroundColor(.white).multilineTextAlignment(.center).bold()
                            })
                    Circle()
                        .fill(Color.gray).opacity(0.9)
                        .frame(width: 160, height: 160).shadow(radius: 5).overlay(
                            VStack {
                                Text("You do not have completed all \n the vegan recipes\n yet!").font(.footnote).foregroundColor(.white).multilineTextAlignment(.center).bold()
                            })
                }.padding()
                HStack{
                    Circle()
                        .fill(Color.gray).opacity(0.9)
                        .frame(width: 160, height: 160).shadow(radius: 5).overlay(
                            VStack {
                                Text("You do not have completed 15\n3-stars-recipes\n yet!").font(.footnote).foregroundColor(.white).multilineTextAlignment(.center).bold()
                            })
                    Circle()
                        .fill(Color.indigo).opacity(0.9)
                        .frame(width: 160, height: 160).shadow(radius: 5).overlay(
                            VStack {
                                Image(systemName: "medal.fill").resizable().frame(width: 60, height: 70).foregroundColor(.white)
                                Text("You have uploaded\nyour first\npicture!").font(.footnote).foregroundColor(.white).multilineTextAlignment(.center).bold()
                            })
                }.padding()
                
            }
        }.navigationTitle(Text("Archievement"))
    }
}

#Preview {
    Archievement()
}
