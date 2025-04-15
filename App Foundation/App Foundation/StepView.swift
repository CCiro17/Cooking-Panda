//
//  StepView.swift
//  App Foundation
//
//  Created by Fabio Fontana on 10/04/25.
//


//
//  StepView.swift
//  Cooking Panda
//
//  Created by Adriana Palmese on 10/04/25.
//
import SwiftUI

struct StepView: View {
    var step: String
    @Binding var isOn: Bool
    
    var body: some View {
        StepCardView {
            HStack(alignment: .top) {
                Text(step)
                    .font(.body)
                    .padding()
                    .foregroundColor(.primary)
                    .fixedSize(horizontal: false, vertical: true)

                Spacer()

                Toggle(isOn: $isOn) {
                    EmptyView()
                }
                .labelsHidden()
                .toggleStyle(SwitchToggleStyle(tint: .green))
                .padding()
            }
            .padding()
        }
        // Se vuoi aggiungere un minimo padding esterno
        .padding(.horizontal)
    }
}
