//
//  ChooseName.swift
//  App Foundation
//
//  Created by Adriana Palmese on 11/04/25.
//


//
//  ChooseName.swift
//  Cooking Panda
//
//  Created by Adriana Palmese on 08/04/25.
//

import SwiftUI

struct ChooseName: View {
    @State public var selectedColor: Color = .black
    @State public var userName: String = ""
    @State private var navigate = false
    
    var body: some View {
        NavigationStack{
        VStack{
            }
            VStack{
                Text("Hi, what's your name?").font(.largeTitle).bold().padding(2)
                //  Circle()
                //  .fill(selectedColor)
                //  .frame(width: 280, height: 280)
                //  .shadow(radius: 10)
                //.padding()
                Image("Pandavacciuolo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 280, height: 280)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                //.padding()
                //}
                //ColorPicker("Choose a Color", selection: $selectedColor)
                //  .padding()
                ZStack{
                    Rectangle().fill(Color.orange).opacity(0.8).frame(width: 330, height: 68).cornerRadius(29)
                    HStack{
                        TextField("Your Name", text:  $userName)
                            .padding(.leading, 60)
                            .foregroundStyle(.white)
                            .font(.title2)
                       
                            Button {
                                UserDefaults.standard.set(userName, forKey: "userName")
                                navigate = true
                            } label: {
                                Image(systemName: "arrow.forward.circle")
                                    .resizable().frame(width: 40, height: 40)
                                    .padding(.trailing,50)
                                    .foregroundStyle(.white)
                            }
                        NavigationLink(destination: Onboarding(), isActive: $navigate) {
                            EmptyView()
                        }

                        
                    }
                }
        }
//            .toolbar{
//                    ToolbarItem(placement: .navigationBarTrailing){
//                        NavigationLink("Skip"){
//                            Pandavacciuolo()
//                        }
//
//                    }
//                }
            }.navigationBarBackButtonHidden()
        }
        
    }


#Preview {
    ChooseName()
}
