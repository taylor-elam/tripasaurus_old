import SwiftUI

struct RoundedRectProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: geometry.size.width, height: 20)
                        .foregroundColor(EventColor.darkGray.mainColor)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: CGFloat(configuration.fractionCompleted ?? 0) * geometry.size.width, height: 20)
                        .foregroundColor(EventColor.green.mainColor)
                }
            }
        }
    }
}
