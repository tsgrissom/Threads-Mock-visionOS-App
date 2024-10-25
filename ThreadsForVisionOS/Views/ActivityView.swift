import SwiftUI

import LoremSwiftum

struct ActivityListPanelViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 420)
            .padding(.horizontal, 15)
            .padding(.top, 5)
    }
}

struct ActivityListItemViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 3)
    }
}

struct ActivityView: View {
    var body: some View {
        let panelMod = ActivityListPanelViewModifier()
        return ScrollView(.horizontal) {
            HStack(spacing: 0) {
                replySection
                    .modifier(panelMod)
                likeSection
                    .modifier(panelMod)
                followSection
                    .modifier(panelMod)
            }
        }
        .navigationTitle("Activity")
    }
}

extension ActivityView {
    private var likeSectionHeader: some View {
        HStack {
            Text("Likes")
                .font(.largeTitle)
            Spacer()
        }
    }
    
    private var likeSection: some View {
        ScrollView {
            VStack {
                likeSectionHeader
                    .offset(x: 48)
                
                ForEach(1...10, id: \.self) { i in
                    AULikedView(
                        username: MockupUtilities.getMockUsername(),
                        likedPostText: Lorem.tweet,
                        timeDifference: MockupUtilities.getMockTimeDifference()
                    )
                    .padding(.horizontal, 2)
                    .modifier(ActivityListItemViewModifier())
                }
            }
        }
    }
    
    private var replySectionHeader: some View {
        HStack {
            Text("Replies")
                .font(.largeTitle)
            Spacer()
        }
    }
    
    private var replySection: some View {
        ScrollView {
            VStack {
                replySectionHeader
                    .offset(x: 13)
                
                ForEach(1...10, id: \.self) { i in
                    AURepliedView(
                        username: MockupUtilities.getMockUsername(),
                        subtext: Lorem.tweet,
                        timeDifference: MockupUtilities.getMockTimeDifference()
                    )
                    .modifier(ActivityListItemViewModifier())
                }
            }
        }
    }
    
    private var followSectionHeader: some View {
        HStack {
            Text("Follows")
                .font(.largeTitle)
            Spacer()
        }
    }
    
    private var followSection: some View {
        ScrollView {
            VStack {
                followSectionHeader
                    .offset(x: 52)
                
                ForEach(1...10, id: \.self) { i in
                    AUFollowedView(
                        username: MockupUtilities.getMockUsername(),
                        timeDifference: MockupUtilities.getMockTimeDifference()
                    )
                    .modifier(ActivityListItemViewModifier())
                }
            }
        }
    }
}

#Preview {
    ZStack {
        RoundedRectangle(cornerRadius: 30)
            .fill(.black.opacity(0.8))
        ActivityView()
            .foregroundStyle(.white)
    }
}
