import SwiftUI

extension TripDetailView {
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
