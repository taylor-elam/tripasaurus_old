import SwiftUI

struct TitleSection: View {
    @Binding var color: EventColor
    @Binding var icon: EventIcon
    @Binding var title: String
    var isSelected: Bool
    var selectRow: (String) -> Void

    var body: some View {
        VStack {
            HStack {
                Button {
                    selectRow("Icon")
                } label: {
                    Image(systemName: icon.name)
                        .resizeImage(width: 30, height: 30)
                        .foregroundColor(color.mainColor)
                        .padding(11)
                }
                .listCardStyle()

                TextField("New Event", text: $title)
                    .font(.title2)
                    .padding(.horizontal)
                    .padding(.vertical, 12)
                    .listCardStyle()
            }
            .padding(.horizontal)

            if isSelected {
                EventIconPicker(eventColor: $color, eventIcon: $icon)
            }
        }
    }
}

struct TitleSection_Previews: PreviewProvider {
    static var previews: some View {
        TitleSection(
            color: .constant(Event.example.color),
            icon: .constant(Event.example.icon),
            title: .constant(Event.example.title),
            isSelected: true,
            selectRow: { row in }
        )
        .background(Color(UIColor.secondarySystemBackground))
        .previewLayout(.sizeThatFits)
    }
}
