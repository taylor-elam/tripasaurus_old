import SwiftUI

struct EventIconPicker: View {
    @Binding var eventColor: EventColor
    @Binding var eventIcon: EventIcon

    private let size: CGFloat = 50
    private let padding: CGFloat = 5

    var body: some View {
        VStack {
            HStack {
                ForEach(EventColor.allCases, id: \.self) { color in
                    Button {
                        eventColor = color
                    } label: {
                        Circle().foregroundColor(color.mainColor)
                    }
                }
            }
            .padding(.horizontal, 10)
            .frame(height: 40)

            Divider()

            ScrollView {
                LazyVGrid(
                    columns: [GridItem(.adaptive(minimum: size))],
                    spacing: padding
                ) {
                    ForEach(EventIcon.allCases, id: \.self) { icon in
                        Button {
                            eventIcon = icon
                        } label: {
                            Image(systemName: icon.name)
                                .resizeImage(width: 30, height: 30)
                                .foregroundColor(eventColor.mainColor)
                                .padding(5)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .drawingGroup()
            }
            .frame(minHeight: 155, maxHeight: 355)
        }
        .padding()
        .listCardStyle()
        .padding(.horizontal)
    }
}

struct EventIconPicker_Previews: PreviewProvider {
    static var previews: some View {
        EventIconPicker(eventColor: .constant(Event.example.color), eventIcon: .constant(Event.example.icon))
            .background(Color(UIColor.secondarySystemBackground))
    }
}
