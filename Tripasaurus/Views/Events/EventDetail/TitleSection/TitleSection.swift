import SwiftUI

struct TitleSection: View {
    @Binding var color: EventColor
    @Binding var icon: EventIcon
    @Binding var title: String
    var isSelected: Bool
    var selectRow: (String) -> Void
    @FocusState var isInputActive: Bool

    var body: some View {
        VStack {
            HStack {
                Button {
                    selectRow("Icon")
                } label: {
                    Image(systemName: icon.name)
                        .imageScale(.large)
                        .foregroundColor(color.mainColor)
                        .frame(width: 40, height: 40)
                        .padding(6)
                }
                .listCardStyle()
                .padding(.trailing, 5)

                TextField("New Event", text: $title)
                    .focused($isInputActive)
                    .font(.title2)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Done") { isInputActive = false }
                        }
                    }
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
