import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "first", isFavourite: true),
        ItemModel(title: "second", isFavourite: false)
    ]
    
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Notes 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
        NavigationLink("Add", destination: AddView())
        )
    }
}

struct ListView_Prewiews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}

