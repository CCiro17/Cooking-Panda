import SwiftUI

struct changeYourAvatar: View {
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
                            AvatarButton(avatar: avatar, color: savedColor, navigate: $navigate, selectedAvatar: $selectedAvatar)
                        }
                    }
                }
            }
        }
    }
}

struct AvatarButton: View {
    var avatar: String
    var color: Color
    @Binding var navigate: Bool // ← puoi rimuoverlo se non ti serve più
    @Binding var selectedAvatar: String

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Button {
                selectedAvatar = avatar
                dismiss() // torna indietro alla schermata Profile
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
        }

    }
}

extension Array {
    // A helper function to split an array into chunks of a specified size
    func chunked(into size: Int) -> [[Element]] {
        var chunks: [[Element]] = []
        for i in stride(from: 0, to: self.count, by: size) {
            let chunk = Array(self[i..<Swift.min(i + size, self.count)])
            chunks.append(chunk)
        }
        return chunks
    }
}
