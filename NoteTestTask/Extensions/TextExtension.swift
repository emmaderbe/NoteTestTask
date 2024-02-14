import SwiftUI

//MARK: - editTextStyle()
extension Text {
    func editTextStyle(style: String, size: CGFloat) -> Text {
        self.font(.custom(style, size: size))
    }
}

//MARK: - editFontWeight()
extension Text {
    func editFontWeight(_ fontWeight: String) -> Text {
        switch fontWeight {
        case "Bold":
            return self.bold()
        case "Italic":
            return self.italic()
        default:
            return self
        }
    }
}

