import SwiftUI

struct DateSection: View {
    @Binding var date: Date
    var isSelected: Bool
    var selectRow: (String) -> Void

    var body: some View {
        VStack {
            HStack {
                Text("Date").font(.callout)
                Spacer()
                if !isSelected {
                    Text(date.formatted(date: .abbreviated, time: .shortened))
                }
            }
            .padding(.vertical, 15)
            .padding(.horizontal, 20)
            .contentShape(Rectangle())
            .onTapGesture { selectRow("Date") }

            if isSelected {
                DatePicker("Date", selection: $date)
                    .datePickerStyle(.graphical)
                    .labelsHidden()
                    .padding(.horizontal)
            }
        }
        .listCardStyle()
        .padding(.horizontal)
    }
}

struct DateSection_Previews: PreviewProvider {
    static var previews: some View {
        DateSection(date: .constant(Event.example.date), isSelected: false, selectRow: {row in })
            .previewLayout(.sizeThatFits)
            .background(Color(UIColor.secondarySystemBackground))
    }
}
