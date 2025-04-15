import SwiftUI
import UIKit


func saveColorToDefaults(_ color: Color, key: String) {
    let uiColor = UIColor(color)
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0

    if uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
        let components = [red, green, blue, alpha]
        UserDefaults.standard.set(components, forKey: key)
    }
}

func loadColorFromDefaults(key: String) -> Color {
    if let components = UserDefaults.standard.array(forKey: key) as? [CGFloat], components.count == 4 {
        let uiColor = UIColor(red: components[0], green: components[1], blue: components[2], alpha: components[3])
        return Color(uiColor)
    }
    return .white // default fallback color
}

