import SwiftUI

struct FeedView: View {
    
    var body: some View {
        HStack {
            ScrollView(showsIndicators: false) {
                PostView(isOwnedByUser: false)
                PostView(isOwnedByUser: false)
                PostView(isOwnedByUser: true)
                PostView(isOwnedByUser: false)
                PostView(isOwnedByUser: false)
                PostView(isOwnedByUser: false)
                PostView(isOwnedByUser: false)
                PostView(isOwnedByUser: false)
                PostView(isOwnedByUser: false)
                PostView(isOwnedByUser: false)
            }
            .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0))
            Spacer()
        }
        .navigationTitle("Your Feed")
    }
}

#Preview {
    ZStack {
        RoundedRectangle(cornerRadius: 30)
            .fill(.black.opacity(0.8))
        FeedView().padding()
    }
}
