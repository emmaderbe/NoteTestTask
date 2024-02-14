import SwiftUI

//MARK: - Property
struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    //MARK: - add list of items, editFavouriteStatus and add onDelete && onMove
    var body: some View {
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.bouncy) {
                            listViewModel.editFavouriteStatus(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem(at:))
        }
        .listStyle(InsetGroupedListStyle())
        //MARK: - Navigation Bar
        .navigationTitle("Notes 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
        )
    }
}

//MARK: - ListView_Prewiews
struct ListView_Prewiews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}

