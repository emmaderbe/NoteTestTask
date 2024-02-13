import SwiftUI

//MARK: - add left image and text
struct ListRowView: View {
    let item: ItemModel
    
    var body: some View {
        VStack {
            NavigationLink(destination: EditView(item: item)) {
                HStack {
                    Image(systemName: item.isFavourite ? "heart.fill" : "heart")
                        .foregroundColor(item.isFavourite ? .red : .gray)
                    Text(item.title)
                        .applyFont(style: item.fontStyle, size: item.fontSize)
                        .editFontWeight(item.fontWeight)
                    Spacer()
                }
                .padding(.vertical, 8)
            }
        }
    }
}

//MARK: - Navigation Bar
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
