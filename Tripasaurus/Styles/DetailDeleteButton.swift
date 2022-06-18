import SwiftUI

struct DetailDeleteButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.vertical)
            .background(.white.opacity(0.7))
            .overlay(Divider(), alignment: .top)
            .overlay(Divider(), alignment: .bottom)
    }
}

extension View {
    func deleteButtonStyle() -> some View {
        modifier(DetailDeleteButton())
    }
}
