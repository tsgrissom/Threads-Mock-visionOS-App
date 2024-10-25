import SwiftUI
import RealityKit
import RealityKitContent

struct MainView: View {
    
    var body: some View {
        NavigationSplitView {
            List {
                navigationLinks
            }
            .navigationTitle("Threads")
        } detail: {
            FeedView()
        }
    }
    
    private var navigationLinks: some View {
        return Group {
            NavigationLink(destination: ActivityView(), label: {
                Label(title: { Text("Activity") }, icon: {
                    Image(systemName: "heart.fill")
                        .foregroundStyle(.white)
                })
            })
            NavigationLink(destination: FeedView(), label: {
                Label(title: { Text("Feed") }, icon: {
                    Image(systemName: "house")
                        .foregroundStyle(.white)
                })
            })
            NavigationLink(destination: NewThreadView(), label: {
                Label(title: { Text("New") }, icon: {
                    Image(systemName: "square.and.pencil")
                        .foregroundStyle(.white)
                })
            })
            NavigationLink(destination: SearchView(), label: {
                Label(title: { Text("Search") }, icon: {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.white)
                })
            })
            NavigationLink(destination: SettingsView(), label: {
                Label(title: { Text("Settings") }, icon: {
                    Image(systemName: "gear")
                        .foregroundStyle(.white)
                })
            })
            NavigationLink(destination: ProfileView(), label: {
                Label(
                    title: { Text("Profile") },
                    icon: {
                        Image(systemName: "person")
                            .foregroundStyle(.white)
                    }
                )
            })
        }
    }
}

#Preview {
    MainView()
}
