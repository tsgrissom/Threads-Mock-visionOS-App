import SwiftUI

struct ProfileView: View {
    
    let isOwnedByUser = true
    
    var body: some View {
        let navTitle: String = isOwnedByUser ? "Your Profile" : "Display Name"
        return VStack {
            upperPanel
            lowerPanel
                .scrollIndicators(.hidden)
            Spacer()
        }
        .foregroundStyle(.white)
        .navigationTitle(navTitle)
    }
}

extension ProfileView {
    
    func getFollowerCount() -> String {
        "\(MockupUtilities.getMockFollowerCount()) followers"
    }
    
    private var upperPanel: some View {
        HStack {
            VStack(alignment: .leading) {
                usernameRow
                followerRow
                topInteractionRow
                    .foregroundStyle(.black)
            }
            .padding(.horizontal, 40)
            .frame(maxWidth: 400)
            Spacer()
        }
    }
    
    private var lowerPanel: some View {
        let recentPostScrollerEdges = EdgeInsets(top: 5, leading: 15, bottom: 10, trailing: 10)
        return ScrollView {
            VStack(spacing: 0) {
                HStack {
                    Text("Recent Posts")
                        .font(.extraLargeTitle2)
                    Spacer()
                }
                .padding(.horizontal, 40)
                
                HStack {
                    recentPostsSection
                        .scrollIndicators(.hidden)
                    Spacer()
                }
                .padding(recentPostScrollerEdges)
            }
        }
    }
    
    private var fediverseLocation: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(.white)
                .frame(maxWidth: 110)
                .frame(maxHeight: 30)
            Text("threads.net")
                .foregroundStyle(.black)
        }
    }
    
    private var usernameRow: some View {
        VStack {
            HStack {
                Text("@userhandle")
                fediverseLocation
                Spacer()
            }
        }
    }
    
    private var followerSamplePictureStack: some View {
        ZStack {
            ProfilePictureView(disableAnimation: true)
            ProfilePictureView(disableAnimation: true)
                .offset(x: 15)
            ProfilePictureView(disableAnimation: true)
                .offset(x: 30)
        }
    }
    
    private var followerRow: some View {
        HStack(spacing: 40) {
            followerSamplePictureStack
            Text(self.getFollowerCount())
            Spacer()
        }
    }
    
    private var topInteractionRow: some View {
        let btnStyle = MetaButtonStyle()
        return HStack {
            if (isOwnedByUser) {
                Button("Edit profile") {
                    
                }
                .buttonStyle(btnStyle)
                
                Spacer()
                    .frame(maxWidth: 20)
                Button("Share profile") {
                    
                }
                .buttonStyle(btnStyle)
            }
            
        }
    }
    
    private var recentPostsSection: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 5) {
                ForEach(1...10, id: \.self) { i in
                    PostView(displayHeader: false, isOwnedByUser: isOwnedByUser)
                }
            }
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
