import SwiftUI

struct ProfilePictureView: View {
    
    let disableAnimation: Bool
    let initLineWidth: CGFloat
    let lineWidthIncrement: CGFloat
    let resourceRef: String
    
    @State var frameDimension: CGFloat
    @State var lineWidth: CGFloat
    
    init(disableAnimation: Bool = false,
         frameDimension: CGFloat = 25,
         lineWidth: CGFloat = 1, lineWidthIncrement: CGFloat = 2,
         resource: String = "https://xsgames.co/randomusers/avatar.php?g=male") {
        self.disableAnimation = disableAnimation
        self.frameDimension = frameDimension
        self.lineWidth = lineWidth
        self.initLineWidth = lineWidth
        self.lineWidthIncrement = lineWidthIncrement
        self.resourceRef = resource
    }
    
    var body: some View {
        ZStack {
            profilePictureLayer
            strokeOverlay
        }
    }
}

extension ProfilePictureView {
    
    func pulseAnimation() {
        if disableAnimation || lineWidth == 0 || lineWidth != initLineWidth {
            return
        }
        
        withAnimation {
            lineWidth += lineWidthIncrement
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            withAnimation {
                lineWidth -= lineWidthIncrement
            }
        })
    }
    
    private var profilePictureLayer: some View {
        return AsyncImage(url: URL(string: resourceRef))
            .frame(width: frameDimension, height: frameDimension)
            .clipShape(Circle())
            .onTapGesture {
                pulseAnimation()
            }
    }
    
    private var strokeOverlay: some View {
        return Circle()
            .stroke(.white, style: StrokeStyle(lineWidth: lineWidth))
            .frame(width: frameDimension, height: frameDimension)
    }
}

#Preview {
    ProfilePictureView(frameDimension: 100)
}
