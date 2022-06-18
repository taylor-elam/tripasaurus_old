import SwiftUI

extension TripDetailView {
    func saveTrip() {
        trip = tripCopy
        dismiss()
    }

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
