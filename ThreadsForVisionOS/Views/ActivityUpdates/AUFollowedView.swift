import SwiftUI

struct AUFollowedView: View {
    
    let maxFrameWidth: CGFloat = 375
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
        HStack(spacing: 0) {
            iconColumn
            descriptiveColumn
                .frame(height: 10)
                .frame(width: 200)
            interactiveColumn
                .frame(width: 150)
        }
        .frame(width: maxFrameWidth)
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
                HStack {
                    Text("Followed \(followedAlteration)")
                        .foregroundStyle(.gray)
                }
            }
            
            Spacer()
        }
    }
    
    private var interactiveColumn: some View {
        HStack {
            Button(action: {
                if interactButtonText == "Follow" {
                    self.interactButtonText = "Following"
                } else if interactButtonText == "Following" {
                    self.interactButtonText = "Follow"
                }
            }) {
                Text(interactButtonText)
            }
            .buttonStyle(MetaButtonStyle())
            
            Spacer()
        }
    }
}

#Preview {
    let followedAlterations = ["you", "you back"]
    let followButtonTextOptions = ["Follow", "Following"]
    return ZStack {
        RoundedRectangle(cornerRadius: 30)
            .backgroundStyle(.black.opacity(0.8))
        
        ScrollView {
            ForEach(1...10, id: \.self) { i in
                AUFollowedView(
                    username: MockupUtilities.getMockUsername(),
                    timeDifference: MockupUtilities.getMockTimeDifference(),
                    followedAlteration: followedAlterations.randomElement() ?? "you",
                    interactButtonText: followButtonTextOptions.randomElement() ?? "Follow"
                )
                .padding(.top, 10)
            }
            .frame(width: 800)
            .foregroundStyle(.black)
        }
    }
}
