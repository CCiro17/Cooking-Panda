import SwiftUI

struct StepsRecipe: View {
    var recipeName: String
    var instructions: [String]
    
    @State private var isOn: [Bool]
    
    init(recipeName: String, instructions: [String]) {
        self.recipeName = recipeName
        self.instructions = instructions
        self._isOn = State(initialValue: Array(repeating: false, count: instructions.count))
    }
    
    var body: some View {
        NavigationStack {
            VStack{
                ProgressView(value: Double(completedSteps()), total: Double(instructions.count))
                    .progressViewStyle(LinearProgressViewStyle(tint: .green))
                    .padding()
                    .frame(height: 10)
                
                Text("Percentage of completion: \(Int(progressPercentage()))%")
                    .foregroundColor(.black)
                    .font(.body)
                    .bold()
            }
            ScrollView {
                VStack {
                    ForEach(instructions.indices, id: \.self) { index in
                        StepView(step: instructions[index], isOn: $isOn[index])
                    }
                    .padding(.vertical, 10)
                }
            }
            
            if progressPercentage() >= 100 {
                NavigationLink(destination: CameraView()) {
                    Text("Upload the picture!")
                        .fontWeight(.bold)
                        .font(.headline)
                        .foregroundColor(.black)
                        .italic()
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
        isOn.filter { $0 }.count
    }
    
    private func progressPercentage() -> Double {
        (Double(completedSteps()) / Double(instructions.count)) * 100
    }
}

