import SwiftUI

struct ProfileAsListItemView: View {
    
    @State private var followingButtonText:String
    
    init(followingButtonText: String = "Follow") {
        self.followingButtonText = followingButtonText
    }
    
    var body: some View {
        HStack {
            profilePictureColumn
            infoColumn
                .frame(maxWidth: 300)
            followActionColumn
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: 100)
    }
}

extension ProfileAsListItemView {
    private var profilePictureColumn: some View {
        return VStack {
            ProfilePictureView(frameDimension: 65, lineWidth: 0)
            Spacer()
        }
    }
    
    private var infoColumn: some View {
        var usernameRow: some View {
            Text("@username")
                .bold()
                .foregroundStyle(.white)
        }
        
        var displayNameRow: some View {
            let insets = EdgeInsets(top: 0, leading: 11, bottom: 20, trailing: 0)
            
            return Text("Display Name")
                .foregroundStyle(.gray)
                .padding(insets)
        }
        
        var nameSection: some View {
            return VStack {
                usernameRow
                displayNameRow
            }
        }
        
        var followerCountGroup: some View {
            return Text("42.0K followers")
                .foregroundStyle(.white)
                .offset(x: 1)
        }
        
        var profilePictureSampleGroup: some View {
            let fd: CGFloat = 20
            let lw: CGFloat = 0.5
            return ZStack {
                ProfilePictureView(disableAnimation: true, frameDimension: fd, lineWidth: lw)
                    .offset(x: -5)
                ProfilePictureView(disableAnimation: true, frameDimension: fd, lineWidth: lw)
                    .offset(x: 4)
            }
        }
        
        return HStack {
            VStack {
                nameSection
                    .offset(x: 5)
                HStack {
                    profilePictureSampleGroup
                    followerCountGroup
                }
                Spacer()
            }
            Spacer()
        }
    }
    
    private var followActionColumn: some View {
        return VStack {
            Button(action: {
                if (self.followingButtonText == "Follow") {
                    self.followingButtonText = "Following"
                } else {
                    self.followingButtonText = "Follow"
                }
            }, label: {
                Text(self.followingButtonText)
            })
            Spacer()
        }
    }
}

#Preview {
    ProfileAsListItemView()
}
