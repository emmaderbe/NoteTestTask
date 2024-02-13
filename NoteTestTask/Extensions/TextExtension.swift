import SwiftUI

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
    
    func applyFont(style: String, size: CGFloat) -> Text {
        switch style {
        case "title":
            return self.font(.system(size: size, weight: .bold))
        case "headline":
            return self.font(.system(size: size, weight: .semibold))
        case "subheadline":
            return self.font(.system(size: size, weight: .light))
        default:
            return self.font(.system(size: size))
        }
    }
}

