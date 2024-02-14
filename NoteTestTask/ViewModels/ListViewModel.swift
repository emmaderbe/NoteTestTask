import CoreData
import SwiftUI

//MARK: - Properties and init()
class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    private let context = CoreDataManager.shared.persistentContainer.viewContext
    
    init() {
        getItems()
        checkAndCreateInitialNote()
    }
}

// MARK: - getItems()
extension ListViewModel {
    func getItems() {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        do {
            let result = try context.fetch(request)
            self.items = result.map { item in
                ItemModel(id: item.id?.uuidString ?? UUID().uuidString,
                          title: item.title ?? "",
                          isFavourite: item.isFavourite,
                          fontStyle: item.fontStyle ?? "Arial",
                          fontSize: CGFloat(item.fontSize),
                          fontWeight: item.fontWeight ?? "Regular")
            }
        } catch {
            print("Ошибка при загрузке заметок: \(error.localizedDescription)")
        }
    }
    
}

// MARK: - addItem()
extension ListViewModel {
    func addItem(title: String, isFavourite: Bool, fontStyle: String, fontSize: CGFloat, fontWeight: String) {
        let newItem = Item(context: context)
        newItem.id = UUID()
        newItem.title = title
        newItem.isFavourite = isFavourite
        newItem.fontStyle = fontStyle
        newItem.fontSize = Float(fontSize)
        newItem.fontWeight = fontWeight
        saveContext()
    }
    
}

// MARK: - deleteItem()
extension ListViewModel {
    func deleteItem(at offsets: IndexSet) {
        for index in offsets {
            let itemModel = items[index]
            if let id = UUID(uuidString: itemModel.id), let itemToDelete = fetchItemById(id: id) {
                context.delete(itemToDelete)
            }
        }
        saveContext()
        getItems()
    }
    
}

// MARK: - updateItem()
extension ListViewModel {
    func updateItem(item: ItemModel) {
        if let id = UUID(uuidString: item.id), let coreDataItem = fetchItemById(id: id) {
            coreDataItem.title = item.title
            coreDataItem.isFavourite = item.isFavourite
            coreDataItem.fontStyle = item.fontStyle
            coreDataItem.fontSize = Float(item.fontSize)
            coreDataItem.fontWeight = item.fontWeight
            saveContext()
        }
    }
}

// MARK: - editFavouriteStatus()
extension ListViewModel {
    func editFavouriteStatus(item: ItemModel) {
        if let id = UUID(uuidString: item.id), let itemToUpdate = fetchItemById(id: id) {
            itemToUpdate.isFavourite.toggle()
            saveContext()
        }
    }
}

// MARK: - saveContext()
extension ListViewModel {
    private func saveContext() {
        do {
            try context.save()
            getItems()
        } catch {
            print("Ошибка сохранения: \(error.localizedDescription)")
        }
    }
}

// MARK: - fetchItemById()
extension ListViewModel {
    private func fetchItemById(id: UUID) -> Item? {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        do {
            let results = try context.fetch(request)
            return results.first
        } catch {
            print("Ошибка при поиске заметки: \(error.localizedDescription)")
            return nil
        }
    }
}

// MARK: - getItems()
extension ListViewModel {
    func checkAndCreateInitialNote() {
            let defaults = UserDefaults.standard
            let hasLaunchedBefore = defaults.bool(forKey: "hasLaunchedBefore")
            
            if !hasLaunchedBefore {
                defaults.set(true, forKey: "hasLaunchedBefore")
                addInitialNote()
            }
        }
}

// MARK: - getItems()
extension ListViewModel {
    private func addInitialNote() {
            let newItem = Item(context: context)
            newItem.id = UUID()
            newItem.title = "Эта заметка — нечто большее, чем просто ответ на техническое задание. Это моя возможность поделиться с вами своим энтузиазмом и готовностью принять новые вызовы с улыбкой :)"
            newItem.isFavourite = true
            newItem.fontStyle = "Arial"
            newItem.fontSize = 18
            newItem.fontWeight = "Regular"
            
            saveContext()
            getItems()
        }
}
