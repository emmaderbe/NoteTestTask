import SwiftUI

//MARK: - Properties and view
struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
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
            .padding(14)
        }
        .navigationTitle("Add a note 🖋️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    }

//MARK: - saveButtonPressed()
extension AddView {
    func saveButtonPressed() {
        if textIsAppropriate() == true {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
}

//MARK: - textIsAppropriate()
extension AddView {
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 1 {
            alertTitle = "Please, add a note"
            showAlert.toggle()
            return false
        }
        return true
    }

}

//MARK: - getAlert()
extension AddView {
    func getAlert() -> Alert {
       return Alert(title: Text(alertTitle))
    }

}

//MARK: - AddView_Previews
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
