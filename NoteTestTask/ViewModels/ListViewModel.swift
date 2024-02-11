import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init() {
       getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "first", isFavourite: true),
            ItemModel(title: "second", isFavourite: false)
        ]
        items.append(contentsOf: newItems)
    }
    
    func deletItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    
    func addItem(title: String) {
       let newItem = ItemModel(title: title, isFavourite: false)
        items.append(newItem)
    }
    
    func editFavouriteStatus(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
}
