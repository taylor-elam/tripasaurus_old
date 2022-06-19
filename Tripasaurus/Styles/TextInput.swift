import SwiftUI

struct TextInput: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(5)
            .background(Color(UIColor.secondarySystemFill))
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
            .onAppear {
                UITextView.appearance().backgroundColor = .clear
            }

    }
}

extension View {
    func textInputStyle() -> some View {
        modifier(TextInput())
    }
}
