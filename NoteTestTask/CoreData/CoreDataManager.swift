import Foundation
import CoreData

//MARK: - Properties
class CoreDataManager: ObservableObject {
    let persistentContainer = NSPersistentContainer(name: "ItemCoreDataModel")
    static let shared: CoreDataManager = CoreDataManager()
    
    private init() {
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
