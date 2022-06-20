import SwiftUI

struct EventDetailView: View {
    @Binding var event: Event

    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var eventStore: EventStore
    @State var eventCopy = Event()
    @State var isNew = false
    @State var selection: String = ""

    var body: some View {
        VStack {
            TitleSection(
                color: $eventCopy.color,
                icon: $eventCopy.icon,
                title: $eventCopy.title,
                isSelected: selection == "Icon",
                selectRow: selectDeselect
            )

            DateSection(
                date: $eventCopy.date,
                isSelected: selection == "date",
                label: "Date",
                selectRow: selectDeselect
            )
            .padding()
            .listCardStyle()
            .padding(.horizontal)

            TaskSection(tasks: $eventCopy.tasks)

            Button(role: .destructive, action: deleteEvent, label: { Label("Delete Event", systemImage: "trash") })
                .deleteButtonStyle()
        }
        .onAppear { eventCopy = event }
        .navigationBarTitle("", displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                if isNew {
                    Button(action: cancelEventEdit, label: { Text("Cancel") })
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button(isNew ? "Add" : "Save") { isNew ? addEvent(event: eventCopy) : saveEvent() }
                    .disabled(eventCopy.title.isEmpty)
            }
        }
        .background(Color(UIColor.secondarySystemBackground))
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EventDetailView(event: .constant(Event.example)).environmentObject(EventStore())
        }
    }
}
