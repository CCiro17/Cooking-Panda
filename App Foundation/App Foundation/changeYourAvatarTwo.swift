//
//  changeYourAvatarTwo.swift
//  App Foundation
//
//  Created by Adriana Palmese on 14/04/25.
//

import SwiftUI

struct changeYourAvatarTwo: View {
    let savedColor = loadColorFromDefaults(key: "savedColor")
    @State private var navigate = false
    
    var Pandas: [String] = ["Panda", "PandaChef", "NeapolitanPanda", "RibbonPanda", "CowboyPanda", "PandaHawaii", "BearPanda", "EvilPanda"]
    
    @AppStorage("selectedAvatar") private var selectedAvatar: String = "BearPanda"
    
    var body: some View {
        VStack {
            Text("Select an Avatar for your profile")
                .font(.title2)
                .fontWeight(.bold)
            Text("This will represent your picture on your profile")
                .font(.subheadline)
                .fontWeight(.regular)
            
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(Pandas.chunked(into: 2), id: \.self) { row in
                    HStack {
                        ForEach(row, id: \.self) { avatar in
                            AvatarButtonTwo(avatar: avatar, color: savedColor, navigate: $navigate, selectedAvatar: $selectedAvatar)
                        }
                    }
                }
            }
        }
    }
}

struct AvatarButtonTwo: View {
    var avatar: String
    var color: Color
    @Binding var navigate: Bool
    @Binding var selectedAvatar: String

    var body: some View {
        Button {
            selectedAvatar = avatar
            navigate = true
        } label: {
            ZStack {
                Circle()
                    .fill(color)
                    .frame(width: 135, height: 135)
                    .shadow(radius: 10)
                    .padding()
                Image(avatar)
                    .resizable()
                    .frame(width: 135, height: 135)
                    .aspectRatio(contentMode: .fill)
            }
        }
        .background(
            NavigationLink(destination: Onboarding(), isActive: $navigate) {
                EmptyView()
            }
        )
    }
}


#Preview {
    changeYourAvatarTwo()
}
