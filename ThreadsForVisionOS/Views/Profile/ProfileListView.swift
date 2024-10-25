import SwiftUI

struct ProfileListView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(1...10, id: \.self) { i in
                    let topEdge: CGFloat = i > 1 ? 5 : 0
                    ProfileAsListItemView()
                        .padding(.top, i > 1 ? topEdge : 0)
                }
            }
        }
    }
}

#Preview {
    ZStack {
        RoundedRectangle(cornerRadius: 30)
            .fill(.black.opacity(0.8))
        ProfileListView()
    }
}
