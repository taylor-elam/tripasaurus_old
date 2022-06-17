import SwiftUI

extension EventDetailView {
    func selectDeselect(row: String) {
        withAnimation(.linear) {
            if selection == row {
                selection = ""
            } else {
                selection = row
            }
        }
    }
}
