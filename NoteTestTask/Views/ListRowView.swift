import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isFavourite ? "heart.fill" : "heart")
                .foregroundColor(item.isFavourite ? .red : .gray)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "first", isFavourite: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
        }
        .previewLayout(.sizeThatFits)
    }
}
