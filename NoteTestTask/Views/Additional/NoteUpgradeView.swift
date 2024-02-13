import SwiftUI

//MARK: - Properties and view
struct NoteUpgradeView: View {
    @Binding var fontStyle: FontStyle
    @Binding var fontSize: CGFloat
    @Binding var fontWeight: FontWeight

    //MARK: - add texts, pickers and slider
    var body: some View {
        VStack {
            Text("Upgrade your notion")
                .padding(.top, 30)
                .font(.headline)
            
            Text("1. Font style:")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 10)
            Picker("Text style", selection: $fontStyle) {
                ForEach(FontStyle.allCases) { style in
                    Text(style.rawValue).tag(style)
                }
            }
            .pickerStyle(.segmented)
            
            Text("2. Text weight:")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 10)
            Picker("Text weight", selection: $fontWeight) {
                ForEach(FontWeight.allCases) { weight in
                    Text(weight.rawValue).tag(weight)
                }
            }
            .pickerStyle(.segmented)
            
            Text("3. Font size: \(fontSize, specifier: "%.0f")")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
            Slider(value: $fontSize, in: 10...30, step: 1)
        }
    }
}
