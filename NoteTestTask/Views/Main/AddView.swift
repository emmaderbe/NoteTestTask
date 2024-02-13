import SwiftUI

//MARK: - Properties and view
struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    @State private var fontStyle: FontStyle = .body
    @State private var fontSize: CGFloat = 14
    @State private var fontWeight: FontWeight = .regular
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: UIScreen.main.bounds.height / 15)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                
                Text("Upgrade your notion")
                    .padding(.top, 30)
                    .font(.headline)
                
                Text("1. Font style:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                Picker("Text style", selection: $fontStyle) {
                    ForEach(FontStyle.allCases) { category in
                        Text(category.rawValue).tag(category)
                        
                    }
                }
                .pickerStyle(.segmented)
                
                
                Text("2. Text weight:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                Picker("Text weight", selection: $fontWeight) {
                    ForEach(FontWeight.allCases) { category in
                        Text(category.rawValue).tag(category)
                        
                    }
                }
                .pickerStyle(.segmented)
                
                Text("3. Font size: \(fontSize, specifier: "%.0f")")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 20)
                Slider(value: $fontSize, in: 10...30, step: 1)
                    .padding(.bottom, 20)
                
                CustomButton(text: "Save".uppercased(), backgroundColor: Color(.systemBlue)) {
                    saveButtonPressed()
                
                }
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
            listViewModel.addItem(title: textFieldText, fontStyle: fontStyle.rawValue, fontSize: fontSize, fontWeight: fontWeight.rawValue)
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
