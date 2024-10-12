import SwiftUI

struct FavoritesView: View {
    
    @State private var selectedItem: Int? = nil
    
    var body: some View {
        ScrollView {
//            VStack(spacing: 10) {
//                ForEach(0 ..< 10) { item in
////                    CardView(item: item, isSelected: selectedItem == item)
////                        .onTapGesture {
////                            withAnimation(.easeInOut) {
////                                selectedItem = selectedItem == item ? nil : item
////                            }
////                        }
//                }
//            }
//            .navigationTitle("List of Lyrics")
        }
        
    }
}


#Preview {
    FavoritesView()
}
