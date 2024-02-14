import Foundation

//MARK: - Property and init()
class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    init() { getItems() }
}

//MARK: - getItems()
extension ListViewModel {
    func getItems() {
        let newItems = [
            ItemModel(title: "first", isFavourite: true),
            ItemModel(title: "second", isFavourite: false)
        ]
        items.append(contentsOf: newItems)
    }
}

//MARK: - deletItem()
extension ListViewModel {
    func deletItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
}

//MARK: - moveItem()
extension ListViewModel {
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
}

//MARK: - addItem()
extension ListViewModel {
    func addItem(title: String, fontStyle: FontStyle, fontSize: CGFloat, fontWeight: FontWeight) {
       let newItem = ItemModel(title: title, isFavourite: false, fontStyle: fontStyle, fontSize: fontSize, fontWeight: fontWeight)
        items.append(newItem)
    }
}

//MARK: - updateItem()
extension ListViewModel {
    func updateItem(id: String, newTitle: String, newFontStyle: FontStyle, newFontSize: CGFloat, newFontWeight: FontWeight) {
        if let index = items.firstIndex(where: { $0.id == id }) {
            items[index] = ItemModel(id: id, title: newTitle, isFavourite: items[index].isFavourite, fontStyle: newFontStyle, fontSize: newFontSize, fontWeight: newFontWeight)
        }
    }
}

//MARK: - editFavouriteStatus()
extension ListViewModel {
    func editFavouriteStatus(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
}
