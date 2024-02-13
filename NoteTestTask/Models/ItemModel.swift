import Foundation

//MARK: - Properties
struct ItemModel: Identifiable {
    let id: String
    var title: String
    let isFavourite: Bool
    
    var fontStyle: FontStyle
    var fontSize: CGFloat
    var fontWeight: FontWeight
    
    //MARK: - init()
    init(id: String = UUID().uuidString, title: String, isFavourite: Bool, fontStyle: FontStyle = .body, fontSize: CGFloat = 18, fontWeight: FontWeight = .regular) {
        self.id = id
        self.title = title
        self.isFavourite = isFavourite
        self.fontStyle = fontStyle
        self.fontSize = fontSize
        self.fontWeight = fontWeight
    }
}

//MARK: - updateCompletion()
extension ItemModel {
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isFavourite: !isFavourite, fontStyle: fontStyle, fontSize: fontSize, fontWeight: fontWeight)
    }
}
