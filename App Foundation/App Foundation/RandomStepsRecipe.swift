//
//  RandomStepsRecipe.swift
//  App Foundation
//
//  Created by Adriana Palmese on 11/04/25.
//

import SwiftUI

private let steps = [
    "Toss everything in a bowl",
    "Drizzle with olive oil and lemon juice",
    "Add salt & pepper to taste"
]

struct RandomStepsRecipe: View {
    
    @State private var isOn = [false, false, false]
    
    var body: some View {
        NavigationStack {
            Text(name)
                .font(.title)
                .padding()
            
            ProgressView(value: Double(completedSteps()), total: Double(steps.count))
                                .progressViewStyle(LinearProgressViewStyle(tint: .green))
                                .padding()
                                .frame(height: 10)
            Text(" Percentage of completion: \(Int(progressPercentage()))%")
                                        .foregroundColor(.black)
                                        .font(.headline)
                                        .bold()
        
            
            ScrollView {
                VStack {
                    ForEach(0..<steps.count, id: \.self) { index in
                        StepView(step: steps[index], isOn: $isOn[index])
                    }.padding(.vertical,10)
                }
            }
            if progressPercentage() >= 100 {
                NavigationLink(destination: CameraView()){
                    Text("Upload the picture!")
                        .fontWeight(.bold).font(.headline)
                        .foregroundColor(.black).italic()
                        .padding()
                        .frame(width: 200)
                        .background(Color.green.opacity(0.3))
                        .cornerRadius(10)
                        .opacity(0.8)
                        .shadow(radius: 5)
               }
                .padding()
            }
        }
        }
        private func completedSteps() -> Int {
                return isOn.filter { $0 }.count
    }
        private func progressPercentage() -> Double {
            return (Double(completedSteps()) / Double(steps.count)) * 100
        }
}

#Preview {
    RandomStepsRecipe()
}
