import SwiftUI

struct TextInput: ViewModifier {
    var label: String

    func body(content: Content) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            if !label.isEmpty {
                Text(LocalizedStringKey(label)).font(.caption).foregroundColor(.secondary)
            }
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
}

extension View {
    func textInputStyle(label: String = "") -> some View {
        modifier(TextInput(label: label))
    }
}
