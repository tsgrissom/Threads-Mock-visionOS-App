import SwiftUI

struct ProfileListView: View {
    var body: some View {
        ScrollView {
            ProfileAsListItemView()
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            Divider()
                .overlay(.black)
            ProfileAsListItemView()
            Divider()
                .overlay(.black)
            ProfileAsListItemView()
            Divider()
                .overlay(.black)
            ProfileAsListItemView()
            Divider()
                .overlay(.black)
            ProfileAsListItemView()
            Divider()
                .overlay(.black)
            ProfileAsListItemView()
        }
    }
}

#Preview {
    ProfileListView()
}
