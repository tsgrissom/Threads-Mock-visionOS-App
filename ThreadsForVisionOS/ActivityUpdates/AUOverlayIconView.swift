import SwiftUI

struct AUOverlayIconView: View {
    let bgRed: CGFloat
    let bgGreen: CGFloat
    let bgBlue: CGFloat
    let circleSize: CGFloat
    let strokeRed: CGFloat
    let strokeGreen: CGFloat
    let strokeBlue: CGFloat
    let strokeLineWidth: CGFloat
    let symbol: String
    let symbolSize: CGFloat
    let symbolYOffset: CGFloat
    
    init(bgRed: CGFloat = 4, bgGreen: CGFloat = 212, bgBlue: CGFloat = 122, circleSize: CGFloat = 25,
         strokeRed: CGFloat = 255, strokeGreen: CGFloat = 255, strokeBlue: CGFloat = 255,
         strokeLineWidth: CGFloat = 2,
         symbol: String, symbolSize: CGFloat = 13, symbolYOffset: CGFloat = 1) {
        self.bgRed = bgRed
        self.bgGreen = bgGreen
        self.bgBlue = bgBlue
        self.circleSize = circleSize
        self.strokeRed = strokeRed
        self.strokeGreen = strokeGreen
        self.strokeBlue = strokeBlue
        self.strokeLineWidth = strokeLineWidth
        self.symbol = symbol
        self.symbolSize = symbolSize
        self.symbolYOffset = symbolYOffset
    }
    
    var body: some View {
        ZStack {
            circleLayer
            iconLayer
        }
    }
}

extension AUOverlayIconView {
    private var circleLayer: some View {
        let bg = Color.init(red: bgRed / 255, green: bgGreen / 255, blue: bgBlue / 255)
        let stroke = Color.init(red: strokeRed / 255, green: strokeGreen / 255, blue: strokeBlue / 255)
        return Circle()
            .fill(bg)
            .stroke(stroke, lineWidth: strokeLineWidth)
            .frame(width: circleSize, height: circleSize)
    }
    
    private var iconLayer: some View {
        Image(systemName: symbol)
            .foregroundStyle(.white)
            .font(.system(size: symbolSize))
            .offset(y: symbolYOffset)
    }
}

#Preview {
    ZStack {
        RoundedRectangle(cornerRadius: 30)
            .fill(.black)
        AUOverlayIconView(
            symbol: "heart.fill"
        )
    }
}
