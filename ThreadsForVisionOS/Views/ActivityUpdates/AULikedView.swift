import SwiftUI

import LoremSwiftum

struct AULikedView: View {
    
    let maxFrameWidth: CGFloat = 375
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
        HStack(spacing: 0) {
            iconColumn
            descriptiveColumn
                .frame(maxHeight: 10)
                .frame(width: 200)
            interactiveColumn
                .frame(width: 150)
        }
        .frame(width: maxFrameWidth)
    }
}

extension AULikedView {
    
    private var overlayIcon: some View {
        AUOverlayIconView(
            bgRed: 212,
            bgGreen: 4,
            bgBlue: 91,
            symbol: "heart.fill"
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
                    Spacer()
                    Text(timeDifference)
                        .foregroundStyle(.gray)
                }
                HStack {
                    Text(likedPostText)
                        .foregroundStyle(.gray)
                }
            }
            
            Spacer()
        }
    }
    
    private var interactiveColumn: some View {
        HStack {
            Button(interactButtonText) {
                if interactButtonText == "Follow" {
                    self.interactButtonText = "Following"
                } else if interactButtonText == "Following" {
                    self.interactButtonText = "Follow"
                }
            }
            .buttonStyle(MetaButtonStyle())
            Spacer()
        }
    }
}

#Preview {
    ZStack {
        RoundedRectangle(cornerRadius: 30)
            .backgroundStyle(.black.opacity(0.8))
        ScrollView {
            ForEach(1...3, id: \.self) { n in
                ForEach(1...10, id: \.self) { i in
                    AULikedView(
                        username: MockupUtilities.getMockUsername(),
                        likedPostText: Lorem.tweet,
                        timeDifference: MockupUtilities.getMockTimeDifference()
                    )
                    .padding(.top, 10)
                }
                .frame(width: 800)
                .foregroundStyle(.black)
            }
        }
    }
}
