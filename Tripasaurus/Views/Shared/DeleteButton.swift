import SwiftUI

struct DeleteButton: View {
    var text: String = ""
    var action: () -> Void

    var body: some View {
        Button(role: .destructive, action: action, label: {
            Label(text, systemImage: "trash")
        })
    }
}

struct DeleteButton_Previews: PreviewProvider {
    static var previews: some View {
        DeleteButton(text: "Delete", action: {})
    }
}
