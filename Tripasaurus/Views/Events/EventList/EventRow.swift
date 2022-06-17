import SwiftUI

struct EventRow: View {
    @Binding var event: Event

    @ScaledMetric var imageWidth: CGFloat = 40

    var body: some View {
        HStack {
            Label {
                VStack(alignment: .leading, spacing: 5) {
                    Text(event.title)
                        .fontWeight(.bold)

                    Text(event.date.formatted(date: .abbreviated, time: .shortened))
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
            } icon: {
                Image(systemName: event.icon.name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .foregroundStyle(event.color.mainColor)
                    .padding(.trailing, 15)
            }
            .labelStyle(CustomLabelStyle())
        }
        .badge(event.remainingTaskCount - event.emptyTaskCount)

        if event.isComplete {
            Image(systemName: "checkmark")
                .foregroundStyle(.secondary)
        }
    }
}

struct EventRow_Previews: PreviewProvider {
    static var previews: some View {
        EventRow(event: .constant(Event.example))
            .previewLayout(.sizeThatFits)
    }
}
