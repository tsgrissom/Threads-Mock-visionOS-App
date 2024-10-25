import SwiftUI

struct SearchView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Search goes here")
            }
            .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
            Divider()
                .overlay(.white)
            HStack {
                ProfileListView()
            }
        }
        .navigationTitle("Search Threads")
    }
}

#Preview {
    ZStack {
        RoundedRectangle(cornerRadius: 30)
            .fill(.black.opacity(0.8))
        SearchView()
            .foregroundStyle(.white)
    }
}

