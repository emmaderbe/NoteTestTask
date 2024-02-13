import SwiftUI

struct CustomButton: View {
    var text: String
    var backgroundColor: Color
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(text)
                .foregroundStyle(.white)
                .font(.headline)
                .frame(height: UIScreen.main.bounds.height / 15)
                .frame(maxWidth: .infinity)
                .background(backgroundColor)
                .cornerRadius(10)
        }
    }
}
