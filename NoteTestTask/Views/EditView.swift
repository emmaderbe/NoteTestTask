import SwiftUI

struct EditView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    var item: ItemModel
    @State private var textFieldText: String

    init(item: ItemModel) {
        self.item = item
        _textFieldText = State(initialValue: item.title)
    }

    var body: some View {
        ScrollView {
            VStack {
                TextField("Please, edit your note title here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                })
            }
            .padding(.top, 15)
            .padding(14)
            
        }
        .navigationTitle("Edit your note 🖍️")
    }
    
    func saveButtonPressed() {
        listViewModel.updateItem(id: item.id, newTitle: textFieldText)
        presentationMode.wrappedValue.dismiss()
        
    }
}

    struct EditView_Previews: PreviewProvider {
        static var item1 = ItemModel(title: "", isFavourite: true)
        static var previews: some View {
            NavigationView {
                EditView(item: item1)
            }
            .environmentObject(ListViewModel())
        }
    }
