import SwiftUI

//MARK: - editTextStyle()
extension Text {
    func editTextStyle(style: FontStyle, size: CGFloat) -> Text {
        self.font(.custom(style.rawValue, size: size))
    }
}

//MARK: - editFontWeight()
extension Text {
    func editFontWeight(_ fontWeight: FontWeight) -> Text {
        switch fontWeight {
        case .bold:
            return self.bold()
        case .italic:
            return self.italic()
        default:
            return self
        }
    }
}

