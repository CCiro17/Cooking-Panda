//
//  ButtonChooseName.swift
//  App Foundation
//
//  Created by Adriana Palmese on 11/04/25.
//


//
//  ButtonChooseName.swift
//  Cooking Panda
//
//  Created by Ciro Cafora on 09/04/25.
//

import SwiftUI

struct ButtonChooseName: View {
    var body: some View {
        ZStack{
                        Rectangle().fill(Color.yellow).opacity(0.8).frame(width: 330, height: 68).cornerRadius(29)
                    Text("Continue").font(.title).italic().foregroundColor(.black)
                    }    }
}

#Preview {
    ButtonChooseName()
}
