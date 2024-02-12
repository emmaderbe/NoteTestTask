import Foundation

//MARK: - Properties
struct ItemModel: Identifiable {
    let id: String
    let title: String
    let isFavourite: Bool
    
    //MARK: - init()
    init(id: String = UUID().uuidString, title: String, isFavourite: Bool) {
        self.id = id
        self.title = title
        self.isFavourite = isFavourite
    }
}

//MARK: - updateCompletion()
extension ItemModel {
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isFavourite: !isFavourite)
    }
}
