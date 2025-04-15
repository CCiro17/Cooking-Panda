//
//  Filter.swift
//  App Foundation
//
//  Created by Adriana Palmese on 11/04/25.
//


//
//  Filter.swift
//  CookingPanda
//
//  Created by Angelica Sannino on 10/04/25.
//

import SwiftUI

struct Filter: View {
    var body: some View {
        VStack{
                Text("Time")
                    .font(.title)
                Spacer()
                VStack{
                    Grid(horizontalSpacing: 30, verticalSpacing: 30) {
                        GridRow {
                            ZStack{
                                Rectangle()
                                    .frame(width: 100, height: 100)  // Set size for the ZStack
                                    Text("j")
                            }        .frame(width: 100, height: 100)  // Set size for the entire ZStack
                            Text("(1, 0)")
                            Text("(2, 0)")
                        }
                        
                        GridRow {
                            Text("(0, 1)")
                            Text("(1, 1)")
                            Text("(2, 1)")
                        }
                        
                        GridRow {
                            Text("(0, 2)")
                            Text("(1, 2)")
                            Text("(2, 2)")
                        }
                    }
                }
            
            
            
        }.navigationTitle("Filter")
    }
}

#Preview {
    Filter()
}