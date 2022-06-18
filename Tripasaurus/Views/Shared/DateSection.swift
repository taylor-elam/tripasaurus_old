import SwiftUI

struct DateSection: View {
    @Binding var date: Date
    var dateFormat: Date.FormatStyle.DateStyle = .abbreviated
    var displayComponents: DatePickerComponents = [.date, .hourAndMinute]
    var id: String = "date"
    var isSelected: Bool
    var label: String = "Date"
    var selectRow: (String) -> Void
    var timeFormat: Date.FormatStyle.TimeStyle = .shortened

    var body: some View {
        VStack {
            HStack {
                Text(label).font(.callout)
                Spacer()
                if !isSelected {
                    Text(date.formatted(date: dateFormat, time: timeFormat))
                }
            }
            .contentShape(Rectangle())
            .onTapGesture { selectRow(id) }

            if isSelected {
                DatePicker(label, selection: $date, displayedComponents: displayComponents)
                    .datePickerStyle(.graphical)
                    .labelsHidden()
            }
        }
    }
}

struct DateSection_Previews: PreviewProvider {
    static var previews: some View {
        DateSection(
            date: .constant(Event.example.date),
            displayComponents: [.date, .hourAndMinute],
            id: "date",
            isSelected: false,
            label: "Date",
            selectRow: {row in }
        )
        .previewLayout(.sizeThatFits)
    }
}