//
//  Pandavacciuolo.swift
//  App Foundation
//
//  Created by Adriana Palmese on 11/04/25.
//


//
//  Pandavacciuolo.swift
//  Cooking Panda
//
//  Created by Adriana Palmese on 08/04/25.
//

import SwiftUI

struct Pandavacciuolo: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack{
                    Text("Hello, Pandavacciuolo here!").font(.headline).bold().padding(2)
                    Text("Let's get started!")
                }
                Image("Pandavacciuolo").resizable().frame(width: 400, height: 520).aspectRatio(contentMode: .fill)
                
                NavigationLink {
                    ChooseName()
                } label: {
                    ButtonChooseName()
                }
            }
        }
    }
    
}

#Preview {
    Pandavacciuolo()
}
