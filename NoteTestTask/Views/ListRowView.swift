import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isFavourite ? "heart.fill" : "heart")
                .foregroundColor(item.isFavourite ? .red : .gray)
            Text(item.title)
            Spacer()
            
            NavigationLink(destination: EditView(item: item)) {}
                .buttonStyle(PlainButtonStyle())
                .frame(width: 0, height: 0)
                .opacity(0)
        }
        .font(.body)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "first initial note", isFavourite: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
        }
        .environmentObject(ListViewModel())
        .previewLayout(.sizeThatFits)
    }
}
