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
    case arial = "Arial"
    case menlo = "Menlo"
    case noteworthy = "Noteworthy"
    case courier = "Courier"
    
    var id: FontStyle {self}
}
