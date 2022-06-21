import SwiftUI

struct EventDetailView: View {
    @Binding var event: Event

    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var eventStore: EventStore
    @State var eventCopy = Event()
    @State var isNew = false
    @State var selection: ExpandableRow = .none

    var body: some View {
        VStack {
            TitleSection(
                color: $eventCopy.color,
                icon: $eventCopy.icon,
                title: $eventCopy.title,
                isSelected: selection == .icon,
                selectRow: { selectDeselect(row: .icon) }
            )

            DateSection(
                date: $eventCopy.date,
                isSelected: selection == .date,
                label: EventVault.date.name,
                selectRow: { selectDeselect(row: .date) }
            )
            .padding()
            .listCardStyle()
            .padding(.horizontal)

            TaskSection(tasks: $eventCopy.tasks)

            DeleteButton(action: deleteEvent, label: EventVault.delete.name).deleteButtonStyle()
        }
        .onAppear { eventCopy = event }
        .toolbar {
            SaveToolbar(isNew: isNew, isSaveDisabled: eventCopy.title.isEmpty, addAction: { add(event: eventCopy) }, cancelAction: cancel, saveAction: saveEvent)
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
