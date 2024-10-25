import SwiftUI

struct FeedView: View {
    
    var body: some View {
        HStack {
            ScrollView(showsIndicators: false) {
                ForEach(1...10, id: \.self) { i in
                    PostView(isOwnedByUser: false)
                }
            }
            .scrollClipDisabled(true)
            .padding(.leading, 25)
            Spacer()
        }
        .navigationTitle("Your Feed")
    }
}

#Preview {
    ZStack {
        RoundedRectangle(cornerRadius: 30)
            .fill(.black.opacity(0.8))
        FeedView()
            .padding()
    }
}
