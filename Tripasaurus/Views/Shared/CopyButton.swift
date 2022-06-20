import SwiftUI

struct CopyButton: View {
    var action: () -> Void

    var body: some View {
        Button(
            action: action,
            label: { Label(LocalizedStringKey(AppVault.copy.name), systemImage: AppSymbol.copy.name) }
        )
        .tint(.purple)
    }
}

struct CopyButton_Previews: PreviewProvider {
    static var previews: some View {
        CopyButton(action: {})
    }
}
