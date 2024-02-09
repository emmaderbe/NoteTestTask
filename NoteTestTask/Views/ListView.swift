import SwiftUI

struct ListView: View {
    
    @State var items: [String] = [
    "first text",
    "second text",
    "third text"
    ]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
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

