import SwiftUI
import RealityKit
import RealityKitContent

struct PostView: View {
    
    @State var btnPostColor: Color = .white
    @State var btnPostText: String = "Post"
    
    let displayReturnButton: Bool
    let displayHeader: Bool
    let isOwnedByUser: Bool
    
    init(displayReturnButton: Bool = false, displayHeader: Bool = true, isOwnedByUser: Bool = false) {
        self.displayReturnButton = displayReturnButton
        self.displayHeader = displayHeader
        self.isOwnedByUser = isOwnedByUser
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            containerLayer
            
            VStack(alignment: .leading, content: {
                if (displayHeader) {
                    headerRow
                }
                
                postContentRow
                    .frame(maxWidth: 500)
                
                if isOwnedByUser {
                    controlRowSelf
                } else {
                    controlRowOther
                }
            })
            .padding()
        }
        .foregroundStyle(.black)
    }
}

extension PostView {
    
    func getPostText() -> String {
        let loremApiUrl = "https://loripsum.net/api/plaintext/short/1/"
        if let url = URL(string: loremApiUrl) {
            do {
                let contents = try String(contentsOf: url)
                return contents
            } catch {
                return "Lorem ipsum dolor sit amet, failed to get API text!"
            }
        }
        
        return "Lorem ipsum dolor sit amet, bad URL for lorem API!"
    }
    
    private var containerLayer: some View {
        return RoundedRectangle(cornerRadius: 15)
            .fill(.white)
            .frame(maxWidth: 550)
            .frame(maxHeight: 300)
    }
    
    private var headerRow: some View {
        return HStack {
            ProfilePictureView(frameDimension: 45)
            Text(isOwnedByUser ? "@you" : "@username")
                .font(.largeTitle)
        }
    }
    
    private var postContentRow: some View {
        return HStack {
            ScrollView {
                Text(getPostText())
            }
            .frame(maxHeight: 130)
            Spacer()
        }
    }
    
    private var controlRowOther: some View {
        return HStack {
            Button(action: {
                
            }, label: {
                Text("Like")
            })
            Button(action: {
                
            }, label: {
                Text("Repost")
            })
        }
    }
    
    private var controlRowSelf: some View {
        return HStack {
            Button(action: {
                
            }, label: {
                Label("Edit", systemImage: "pencil")
            })
            Button(action: {
                
            }, label: {
                Label("Delete", systemImage: "trash")
                    .foregroundStyle(.red)
            })
        }
    }
}

#Preview {
    PostView(isOwnedByUser: false)
}
