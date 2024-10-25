import SwiftUI

struct AUFollowedView: View {
    
    let username: String
    let timeDifference: String
    let followedAlteration: String
    
    @State var interactButtonText: String
    
    init(username: String, timeDifference: String, followedAlteration: String = "you", interactButtonText: String = "Follow") {
        self.username = username
        self.timeDifference = timeDifference
        self.followedAlteration = followedAlteration
        self.interactButtonText = interactButtonText
    }
    
    var body: some View {
        HStack {
            iconColumn
            descriptiveColumn
            Spacer()
            interactiveColumn
        }
        .frame(width: 450)
    }
}

extension AUFollowedView {
    private var overlayIcon: some View {
        return AUOverlayIconView(
            bgRed: 84,
            bgGreen: 43,
            bgBlue: 166,
            symbol: "person.fill",
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
            HStack {
                Text("Followed \(followedAlteration)")
                    .foregroundStyle(.gray)
            }
        }
    }
    
    private var interactiveColumn: some View {
        Button(action: {
            if interactButtonText == "Follow" {
                self.interactButtonText = "Following"
            } else if interactButtonText == "Following" {
                self.interactButtonText = "Follow"
            }
        }) {
            Text(interactButtonText)
        }
    }
}

#Preview {
    ZStack {
        RoundedRectangle(cornerRadius: 30)
            .backgroundStyle(.black.opacity(0.8))
        VStack {
            AUFollowedView(username: "tgrissom", timeDifference: "10h", followedAlteration: "you back", interactButtonText: "Following")
                .foregroundColor(.black)
            AUFollowedView(username: "randomuser3646", timeDifference: "10w")
                .foregroundColor(.black)
        }
    }
}
