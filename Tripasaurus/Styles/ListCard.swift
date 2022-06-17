import SwiftUI

struct ListCard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(.white)
            .cornerRadius(10)
    }
}

extension View {
    func listCardStyle() -> some View {
        modifier(ListCard())
    }
}
