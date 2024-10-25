import SwiftUI

struct AURepliedView: View {
    
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
        HStack {
            iconColumn
            descriptiveColumn
            Spacer()
        }
        .frame(width: 325)
    }
    
    private var overlayIcon: some View {
        return AUOverlayIconView(
            bgRed: 59,
            bgGreen: 205,
            bgBlue: 227,
            symbol: "arrow.turn.up.left",
            symbolYOffset: 0
        )
    }
    
    private var iconColumn: some View {
        return ZStack {
            ProfilePictureView(disableAnimation: true, frameDimension: 40)
            overlayIcon
                .offset(x: 15, y: 10)
        }
    }
    
    private var descriptiveColumn: some View {
        return VStack(alignment: .leading) {
            HStack {
                Text(username)
                    .bold()
                Text(timeDifference)
                    .foregroundStyle(.gray)
            }
            Text("Replied to \(repliedToAlteration)")
                .foregroundStyle(.gray)
            Text(subtext)
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    ZStack {
        RoundedRectangle(cornerRadius: 30)
            .backgroundStyle(.black.opacity(0.8))
        VStack {
            AURepliedView(username: "tgrissom", subtext: "Hello world!", timeDifference: "3w")
            AURepliedView(username: "loremipsum", subtext: "Lorem ipsum dolor", timeDifference: "10h")
        }
        .foregroundStyle(.black)
    }
}
