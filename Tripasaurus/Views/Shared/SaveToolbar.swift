import SwiftUI

struct SaveToolbar: ToolbarContent {
    var isNew: Bool
    var isSaveDisabled: Bool
    var addAction: () -> Void
    var cancelAction: () -> Void
    var saveAction: () -> Void

    var body: some ToolbarContent {
        Group {
            ToolbarItem(placement: .cancellationAction) {
                if isNew { Button(action: cancelAction, label: { Text("Cancel") }) }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button(
                    action: isNew ? addAction : saveAction,
                    label: { Text(isNew ? "Add" : "Save").disabled(isSaveDisabled) }
                )
            }
        }
    }
}
