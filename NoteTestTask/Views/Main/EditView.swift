import SwiftUI

//MARK: - Properties, init and view
struct EditView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    
    var item: ItemModel
    
    @State private var textFieldText: String
    
    @State private var fontStyle: FontStyle
    @State private var fontSize: CGFloat
    @State private var fontWeight: FontWeight
    
    init(item: ItemModel) {
        self.item = item
        _fontSize = State(initialValue: item.fontSize)
        _fontStyle = State(initialValue: item.fontStyle)
        _textFieldText = State(initialValue: item.title)
        _fontWeight = State(initialValue: item.fontWeight)
    }
   
    //MARK: - add textField, NoteUpgradeView and CustomButton
    var body: some View {
        ScrollView {
            VStack {
                TextField("Please, edit your note title here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: UIScreen.main.bounds.height / 15)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                
                NoteUpgradeView(fontStyle: $fontStyle, fontSize: $fontSize, fontWeight: $fontWeight)
                    .padding(.bottom, 20)
                
                CustomButton(text: "Save".uppercased(), backgroundColor: Color(.systemBlue)) {
                    saveButtonPressed()
                }
            }
            .padding(14)
            
        }
        .navigationTitle("Edit your note 🖍️")
    }
}

//MARK: - saveButtonPressed()
extension EditView {
    func saveButtonPressed() {
        listViewModel.updateItem(id: item.id, newTitle: textFieldText, newFontStyle: fontStyle, newFontSize: fontSize, newFontWeight: fontWeight)
        presentationMode.wrappedValue.dismiss()
        
    }
}

//MARK: - saveButtonPressed()
struct EditView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "", isFavourite: true)
    static var previews: some View {
        NavigationView {
            EditView(item: item1)
        }
        .environmentObject(ListViewModel())
    }
}
