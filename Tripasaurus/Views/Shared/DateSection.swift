import SwiftUI

struct DateSection: View {
    @Binding var date: Date
    var dateFormat: Date.FormatStyle.DateStyle = .abbreviated
    var displayComponents: DatePickerComponents = [.date, .hourAndMinute]
    var isSelected: Bool
    var label: String
    var selectRow: () -> Void
    var timeFormat: Date.FormatStyle.TimeStyle = .shortened

    var body: some View {
        VStack {
            HStack {
                Text(LocalizedStringKey(label)).font(.callout)
                Spacer()
                if !isSelected { Text(date.formatted(date: dateFormat, time: timeFormat)) }
            }
            .contentShape(Rectangle())
            .onTapGesture { selectRow() }

            if isSelected {
                DatePicker(LocalizedStringKey(label), selection: $date, displayedComponents: displayComponents)
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
            isSelected: false,
            label: TripVault.startDate.name,
            selectRow: { }
        )
        .previewLayout(.sizeThatFits)
    }
}
