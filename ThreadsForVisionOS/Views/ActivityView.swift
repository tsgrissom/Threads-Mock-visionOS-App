import SwiftUI

struct ActivityView: View {
    var body: some View {
        VStack {
            Text("Threads activity page")
        }
        .navigationTitle("Activity")
    }
}

#Preview {
    ZStack {
        RoundedRectangle(cornerRadius: 30)
            .fill(.black.opacity(0.8))
        ActivityView()
            .foregroundStyle(.white)
    }
}
