//
//  StepCardView.swift
//  App Foundation
//
//  Created by Fabio Fontana on 10/04/25.
//


//
//  StepCardView.swift
//  Cooking Panda
//
//  Created by Adriana Palmese on 10/04/25.
//
import SwiftUI

struct StepCardView<Content: View>: View {
    var content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        Rectangle()
            .fill(Color.white)
            .frame(width: 370, height: 150, alignment: .leading)
            .cornerRadius(46)
            .opacity(0.3)
            .shadow(radius: 10).buttonBorderShape(.roundedRectangle(radius: 46))
        
            .overlay(content)
    }
}
