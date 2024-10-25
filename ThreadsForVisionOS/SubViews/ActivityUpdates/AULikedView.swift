import SwiftUI

struct AULikedView: View {
    
    let username: String
    let likedPostText: String
    let timeDifference: String
    
    @State var interactButtonText: String
    
    init(username: String, likedPostText: String, timeDifference: String, interactButtonText: String = "Follow") {
        self.username = username
        self.likedPostText = likedPostText
        self.timeDifference = timeDifference
        self.interactButtonText = interactButtonText
    }
    
    var body: some View {
        HStack {
            iconColumn
            descriptiveColumn
                .frame(maxHeight: 10)
                .frame(width: 200)
            interactiveColumn
                .frame(width: 150)
        }
        .frame(width: 325)
    }
}

extension AULikedView {
    private var overlayIcon: some View {
        return AUOverlayIconView(
            bgRed: 212,
            bgGreen: 4,
            bgBlue: 91,
            symbol: "heart.fill"
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
                Text(likedPostText)
                    .foregroundStyle(.gray)
            }
        }
    }
    
    private var interactiveColumn: some View {
        return HStack {
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
}

#Preview {
    ZStack {
        RoundedRectangle(cornerRadius: 30)
            .backgroundStyle(.black.opacity(0.8))
        VStack {
            AULikedView(username: "tgrissom", likedPostText: "Lorem ipsum dolor, shipsum flipsum", timeDifference: "10h")
                .foregroundColor(.black)
            AULikedView(username: "randomuser3646", likedPostText: "Lorem ipsum dolor, shipsum flipsum", timeDifference: "10m")
                .foregroundColor(.black)
        }
    }
}
