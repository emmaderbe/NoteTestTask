import SwiftUI

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
    
    func applyFont(style: FontStyle, size: CGFloat) -> Text {
        switch style {
        case .title:
            return self.font(.system(size: size, weight: .bold))
        case .headline:
            return self.font(.system(size: size, weight: .semibold))
        case .subheadline:
            return self.font(.system(size: size, weight: .light))
        default:
            return self.font(.system(size: size))
        }
    }
}

