import SwiftUI

struct NewThreadView: View {
    
    let visibilityOptions: [String] = ["Anyone can reply", "Profiles you follow", "Mentioned only"]
    let username: String
    let leftPaneWidth: CGFloat = 400
    let rightPaneWidth: CGFloat = 200
    
    @State private var initialPostText: String = ""
    @State private var subsequentPostText: String = ""
    @State private var postVisibility: String = "Anyone can reply"
    
    init(username: String = MockupUtilities.getMockUsername()) {
        self.username = username
    }
    
    var body: some View {
        HStack(spacing: 0) {
            leftPane
                .frame(width: leftPaneWidth)
                .padding(.top, 15)
                .padding(.leading, 35)
                .scrollIndicators(.hidden)
                .scrollClipDisabled()
            rightPane
                .frame(width: rightPaneWidth)
                .padding(.top, 15)
                .padding(.leading, 5)
            Spacer()
        }
        .navigationTitle("New thread")
    }
    
    private var leftPane: some View {
        let spacerHeight: CGFloat = 175
        return ScrollView {
            VStack {
                ZStack {
                    VStack(spacing: 0) {
                        initialPostRow
                        Spacer()
                            .frame(height: spacerHeight)
                        HStack {
                            subsequentPostRow
                                .padding(.top, 35)
                                .padding(.leading, 25)
                        }
                        .frame(width: leftPaneWidth + 50)
                        .scrollIndicators(.hidden)
                        .padding(.top, 45)
                    }
                    // Vertical divider & attach button overlayed via ZStack for perfect alignment
                    interThreadRow
                        .padding(.leading, 34)
                        .offset(y: 42)
                }
            }
        }
    }
    
    private var rightPane: some View {
        return HStack {
            postSettingsSection
            Spacer()
        }
    }
}

extension NewThreadView {
    func cycleVisibility() {
        var ind = visibilityOptions.firstIndex(of: self.postVisibility) ?? 0
        
        ind += 1
        
        if ind >= visibilityOptions.count {
            ind = 0
        }
        
        self.postVisibility = visibilityOptions[ind]
    }
    
    private var initialPostRow: some View {
        let promptText: Text = Text("Start a thread...")
            .foregroundStyle(.white)
        
        return HStack {
            ProfilePictureView(disableAnimation: true, frameDimension: 65)
                .offset(y: -5)
            VStack {
                HStack {
                    Text(username)
                        .bold()
                    Spacer()
                }
                HStack {
                    TextField("First post", text: $initialPostText,
                              prompt: promptText,
                              axis: .vertical)
                        .textFieldStyle(.plain)
                        .background(.thinMaterial)
                        .cornerRadius(5)
                        .lineLimit(3...10)
                        .foregroundStyle(.black)
                        .frame(width: 275)
                    Spacer()
                }
            }
        }
    }
    
    private var interThreadRow: some View {
        return HStack {
            // Vertical divider
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(.white)
                .frame(width: 3, height: 225)
                .offset(y: -37)
            Button(action: {
                
            }) {
                Image(systemName: "paperclip")
            }
            .buttonStyle(MetaButtonStyle())
            .padding(.leading, 28)
            .padding(.bottom, 55)
            Spacer()
        }
    }
    
    private var subsequentPostRow: some View {
        let promptText: Text = Text("Add to thread")
            .foregroundStyle(.white)
        
        return HStack {
            VStack {
                Image(systemName: "plus.square.fill")
                    .font(.system(size: 20))
                    .padding(.top, 2)
                Spacer()
            }
            TextField("Subsequent post", text: $subsequentPostText, prompt: promptText, axis: .vertical)
                .background(.thinMaterial)
            .cornerRadius(5)
            .lineLimit(3...10)
            .foregroundStyle(.white)
            .padding(.leading, 18)
            .frame(width: 300)
            .textFieldStyle(.roundedBorder)
            Spacer()
        }
    }
    
    private var postSettingsSection: some View {
        return VStack(spacing: 0) {
            HStack {
                Text("Post Settings")
                    .font(.title3)
                Spacer()
            }
            .padding(.bottom, 10)
            
            HStack {
                Button(action: {
                    self.cycleVisibility()
                }) {
                    Text(self.postVisibility)
                        .font(.system(size: 20))
                        .foregroundStyle(.white)
                        .frame(width: 160, alignment: .leading)
                }
                .buttonStyle(.plain)
                Spacer()
            }
            .padding(.bottom, 3)
            
            HStack {
                Button(action: {
                    
                }) {
                    Text("Post")
                        .font(.system(size: 20))
                        .bold()
                        .foregroundStyle(.blue)
                }
                .buttonStyle(.plain)
                Spacer()
            }
            Spacer()
        }
    }
}

#Preview {
    ZStack {
        RoundedRectangle(cornerRadius: 30)
            .fill(.black.opacity(0.9))
        NewThreadView()
    }
}
