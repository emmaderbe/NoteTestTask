import Foundation

//MARK: - Properties
enum FontWeight: String, CaseIterable, Identifiable {
    case bold = "Bold"
    case italic = "Italic"
    case regular = "Regular"
    
    var id: FontWeight {self}
}

//MARK: - Properties
enum FontStyle: String, CaseIterable, Identifiable {
    case title = "Title"
    case headline = "Headline"
    case body = "Body"
    case subheadline = "Subheadline"
    
    var id: FontStyle {self}
}
