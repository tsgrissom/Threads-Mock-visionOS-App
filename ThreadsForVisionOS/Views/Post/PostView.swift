import SwiftUI
import RealityKit
import RealityKitContent

import LoremSwiftum

struct PostView: View {
    
    let shouldDisplayReturnButton: Bool
    let shouldDisplayHeader: Bool
    let isOwnedByCurrentUser: Bool
    let firstName: String
    let lastName: String

    @State var isLiked: Bool
    @State var isReposted: Bool
    
    init(
        shouldDisplayReturnButton: Bool = false,
        shouldDisplayHeader: Bool = true,
        isOwnedByCurrentUser: Bool = false,
        isLiked: Bool = false,
        isReposted: Bool = false
    ) {
        self.shouldDisplayReturnButton = shouldDisplayReturnButton
        self.shouldDisplayHeader = shouldDisplayHeader
        self.isOwnedByCurrentUser = isOwnedByCurrentUser
        self.isLiked = isLiked
        self.isReposted = isReposted
        self.firstName = Lorem.firstName
        self.lastName = Lorem.lastName
    }
    
    var body: some View {
        ZStack {
            containerLayer
            containerContents
        }
        .frame(width: 550, height: 250)
        .foregroundStyle(.black)
    }
}

extension PostView {
    func getUsername() -> String {
        MockupUtilities.getMockUsername(firstName: self.firstName, lastName: self.lastName)
    }
    
    private var containerLayer: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(.white)
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
    }
    
    private var containerContents: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading) {
                headerRow
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .zIndex(5)
            .frame(width: .infinity)
            .frame(height: 45)
            .clipShape(Capsule())
            // For noclip ScrollView to occlude the ScrollView if it goes behind the header
            
            HStack {
                postContentRow
                    .scrollIndicators(.hidden)
                    .frame(maxHeight: 120)
                    .frame(maxWidth: 500)
                    .lineLimit(5)
                    .padding(.all, 8)
                    .background(Color.init(red: 249 / 255, green: 249 / 255, blue: 249 / 255))
                    .cornerRadius(10)
            }
            .padding(.top, 5)
            
            controlRow
                .padding(.top, 5)
                .padding(.horizontal, 25)
        }
    }
    
    private var headerRow: some View {
        return HStack {
            ProfilePictureView(frameDimension: 45)
            Text(isOwnedByUser ? "Your Post" : self.getUsername())
                .font(.largeTitle)
            Spacer()
        }
    }
    
    private var postContentRow: some View {
        ScrollView {
            VStack(spacing: 0) {
                Text(Lorem.tweet)
            }
        }
    }
    
    private var controlRow: some View {
        HStack(spacing: 0) {
            if self.isOwnedByUser {
                controlRowSelf
            } else {
                controlRowOther
            }
            Spacer()
        }
    }
    
    private var controlRowOther: some View {
        let btnStyle = MetaButtonStyle()
        return Group {
            HStack {
                if isLiked {
                    Button(action: {
                        self.isLiked = false
                    }, label: {
                        Text("Liked")
                    })
                    .buttonStyle(btnStyle)
                } else {
                    Button(action: {
                        self.isLiked = true
                    }, label: {
                        Text("Like")
                    })
                    .buttonStyle(btnStyle)
                }
                Spacer()
            }
            .frame(width: 90)
            
            HStack {
                if isReposted {
                    Button(action: {
                        self.isReposted = false
                    }, label: {
                        Text("Reposted")
                    })
                    .buttonStyle(btnStyle)
                } else {
                    Button(action: {
                        self.isReposted = true
                    }, label: {
                        Text("Repost")
                    })
                    .buttonStyle(btnStyle)
                }
                Spacer()
            }
            .frame(width: 120)
        }
    }
    
    private var controlRowSelf: some View {
        let btnStyle = MetaButtonStyle()
        return Group {
            HStack {
                Button(action: {
                    
                }, label: {
                    Label("Edit", systemImage: "pencil")
                })
                .buttonStyle(btnStyle)
                Spacer()
            }
            .frame(width: 125)
            
            HStack {
                Button(action: {
                    
                }, label: {
                    Label(
                        title: { Text("Delete") },
                        icon: {
                            Image(systemName: "trash")
                                .font(.system(size: 16))
                        }
                    )
                    .foregroundStyle(.red)
                })
                .buttonStyle(btnStyle)
                Spacer()
            }
            .frame(width: 140)
        }
    }
}

#Preview {
    ZStack {
        RoundedRectangle(cornerRadius: 30)
            .fill(.black.opacity(0.8))
        ScrollView {
            PostView(isOwnedByUser: false)
            PostView(isOwnedByUser: true)
        }
    }
}
