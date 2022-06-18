import SwiftUI

struct SectionHeader: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.callout)
            .fontWeight(.bold)
            .foregroundColor(.secondary)
    }
}

extension View {
    func sectionHeaderStyle() -> some View {
        modifier(SectionHeader())
    }
}
