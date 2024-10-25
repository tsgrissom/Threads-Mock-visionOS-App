import SwiftUI

import LoremSwiftum

struct AURepliedView: View {
    
    let maxFrameWidth: CGFloat = 375
    let username: String
    let repliedToAlteration: String
    let subtext: String
    let timeDifference: String
    
    init(username: String, repliedToAlteration: String = "you", subtext: String, timeDifference: String) {
        self.username = username
        self.repliedToAlteration = repliedToAlteration
        self.subtext = subtext
        self.timeDifference = timeDifference
    }
    
    var body: some View {
        HStack(spacing: 0) {
            iconColumn
            descriptiveColumn
                .frame(width: 350)
        }
    }
    
    private var overlayIcon: some View {
        AUOverlayIconView(
            bgRed: 59,
            bgGreen: 205,
            bgBlue: 227,
            symbol: "arrow.turn.up.left",
            symbolYOffset: 0
        )
    }
    
    private var iconColumn: some View {
        HStack {
            ZStack {
                ProfilePictureView(disableAnimation: true, frameDimension: 40)
                overlayIcon
                    .offset(x: 15, y: 10)
            }
            
            Spacer()
                .frame(width: 20)
        }
    }
    
    private var descriptiveColumn: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(username)
                        .bold()
                    Text(timeDifference)
                        .foregroundStyle(.gray)
                }
                Text("Replied to \(repliedToAlteration)")
                    .foregroundStyle(.gray)
                Text(subtext)
                    .lineLimit(1)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
        }
    }
}

#Preview {
    ZStack {
        RoundedRectangle(cornerRadius: 30)
            .backgroundStyle(.black.opacity(0.8))
        ScrollView {
            ForEach(1...10, id: \.self) { i in
                AURepliedView(
                    username: MockupUtilities.getMockUsername(),
                    subtext: Lorem.tweet,
                    timeDifference: MockupUtilities.getMockTimeDifference()
                )
            }
        }
        .frame(width: 800)
        .foregroundStyle(.black)
    }
}
