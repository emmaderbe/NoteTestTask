import SwiftUI

struct ListRowView: View {
    
    let title: String
    
    
    var body: some View {
        HStack {
            Image(systemName: "circle.fill")
            Text(title)
            Spacer()
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(title: "This is text")
    }
}
