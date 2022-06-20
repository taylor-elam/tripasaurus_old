import SwiftUI

struct DeleteButton: View {
    var action: () -> Void
    var label: String = "Delete"

    var body: some View {
        Button(
            role: .destructive,
            action: action,
            label: { Label(label, systemImage: AppSymbol.delete.name) }
        )
    }
}

struct DeleteButton_Previews: PreviewProvider {
    static var previews: some View {
        DeleteButton(action: {}, label: "Delete")
    }
}
