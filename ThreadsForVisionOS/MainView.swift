import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationSplitView {
            List {
                navigationLinks
                    .foregroundStyle(.white)
            }
            .navigationTitle("Threads")
        } detail: {
            FeedView()
        }
    }
}

extension MainView {
    private var navigationLinks: some View {
        Group {
            NavigationLink(destination: ActivityView()) {
                activityLabel
            }
            NavigationLink(destination: FeedView()) {
                feedLabel
            }
            NavigationLink(destination: NewThreadView()) {
                newThreadLabel
            }
            NavigationLink(destination: SearchView()) {
                searchLabel
            }
            NavigationLink(destination: SettingsView()) {
                settingsLabel
            }
            NavigationLink(destination: ProfileView()) {
                profileLabel
            }
        }
    }
    
    private var activityLabel: some View {
        Label(title: { Text("Activity") }, icon: {
            Image(systemName: "heart")
        })
    }
              
    private var feedLabel: some View {
        Label(title: { Text("Feed") }, icon: {
            Image(systemName: "house")
        })
    }
    
    private var newThreadLabel: some View {
        Label(title: { Text("New") }, icon: {
            Image(systemName: "square.and.pencil")
        })
    }
    
    private var searchLabel: some View {
        Label(title: { Text("Search") }, icon: {
            Image(systemName: "magnifyingglass")
        })
    }
    
    private var settingsLabel: some View {
        Label(title: { Text("Settings") }, icon: {
            Image(systemName: "gear")
        })
    }
    
    private var profileLabel: some View {
        Label(title: { Text("Profile") }, icon: {
            Image(systemName: "person")
        })
    }
}

#Preview {
    MainView()
}
