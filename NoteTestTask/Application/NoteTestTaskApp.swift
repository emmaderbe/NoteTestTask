import SwiftUI

@main
struct NoteTestTaskApp: App {
    let persistenceController = CoreDataManager.shared.persistentContainer
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
            .environment(\.managedObjectContext, persistenceController.viewContext)
        }
    }
}
