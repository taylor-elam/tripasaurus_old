import SwiftUI

struct SaveToolbar: ToolbarContent {
    var isNew: Bool
    var isSaveDisabled: Bool
    var showCancelButton: Bool

    var addAction: () -> Void = {}
    var cancelAction: () -> Void = {}
    var saveAction: () -> Void = {}

    var body: some ToolbarContent {
        Group {
            ToolbarItem(placement: .cancellationAction) {
                if isNew { Button(action: cancelAction, label: { Text(LocalizedStringKey(AppVault.cancel.name)) }) }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button(
                    action: isNew ? addAction : saveAction,
                    label: { Text(LocalizedStringKey(isNew ? AppVault.add.name : AppVault.save.name)).disabled(isSaveDisabled) }
                )
            }
        }
    }
}
