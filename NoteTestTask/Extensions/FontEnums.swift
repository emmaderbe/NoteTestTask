import Foundation

//MARK: - enum for Font Weight
enum FontWeight: String, CaseIterable, Identifiable {
    case bold = "Bold"
    case italic = "Italic"
    case regular = "Regular"
    
    var id: FontWeight {self}
}

//MARK: - enum for Font Style
enum FontStyle: String, CaseIterable, Identifiable {
    case title = "Title"
    case headline = "Headline"
    case body = "Body"
    case subheadline = "Subheadline"
    
    var id: FontStyle {self}
}
