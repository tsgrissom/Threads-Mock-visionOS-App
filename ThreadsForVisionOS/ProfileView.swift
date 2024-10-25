import SwiftUI

struct ProfileView: View {
    
    let isOwnedByUser = true
    
    var body: some View {
        HStack {
            VStack {
                VStack {
                    headerRow
                    followerRow
                    topInteractionRow
                        .foregroundStyle(.black)
                    Divider()
                        .overlay(.white)
                        .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                    postsSection
                }
                .padding(getInnerPadding())
                Spacer()
            }
            .cornerRadius(20)
            .foregroundStyle(.white)
            .frame(maxWidth: 400)
            Spacer()
        }
    }
}

extension ProfileView {
    func getInnerPadding() -> EdgeInsets {
        return EdgeInsets(top: 5, leading: 40, bottom: 5, trailing: 40)
    }
    
    private var headerRow: some View {
        return VStack {
            HStack {
                Text("@userhandle")
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.white)
                        .frame(maxWidth: 110)
                        .frame(maxHeight: 30)
                    Text("threads.net")
                        .foregroundStyle(.gray)
                }
                Spacer()
            }
        }
        .navigationTitle(isOwnedByUser ? "Your Profile" : "Display Name")
    }
    
    private var followerRow: some View {
        let followerCount = Int.random(in: 100..<500)
        return HStack(spacing: 40) {
            ZStack {
                ProfilePictureView(disableAnimation: true)
                ProfilePictureView(disableAnimation: true)
                    .offset(x: 15)
                ProfilePictureView(disableAnimation: true)
                    .offset(x: 30)
            }
            Text("\(followerCount) followers")
            Spacer()
        }
    }
    
    private var topInteractionRow: some View {
        return HStack {
            if (isOwnedByUser) {
                Button("Edit profile") {
                    
                }
                .background(.white)
                .clipShape(Capsule())
                .buttonStyle(.borderless)
                
                Spacer()
                    .frame(maxWidth: 20)
                Button("Share profile") {
                    
                }
                .background(.white)
                .clipShape(Capsule())
                .buttonStyle(.borderless)
            }
            
        }
    }
    
    private var postsSection: some View {
        return ScrollView {
            PostView(displayHeader: false, isOwnedByUser: isOwnedByUser)
            PostView(displayHeader: false, isOwnedByUser: isOwnedByUser)
            PostView(displayHeader: false, isOwnedByUser: isOwnedByUser)
            PostView(displayHeader: false, isOwnedByUser: isOwnedByUser)
            PostView(displayHeader: false, isOwnedByUser: isOwnedByUser)
            PostView(displayHeader: false, isOwnedByUser: isOwnedByUser)
            PostView(displayHeader: false, isOwnedByUser: isOwnedByUser)
        }
    }
}

#Preview {
    ZStack {
        RoundedRectangle(cornerRadius: 30)
            .fill(.black.opacity(0.8))
        ProfileView()
    }
}
