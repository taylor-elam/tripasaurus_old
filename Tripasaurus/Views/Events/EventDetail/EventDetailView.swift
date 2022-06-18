import SwiftUI

struct EventDetailView: View {
    @Binding var event: Event

    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var eventStore: EventStore
    @State var eventCopy = Event()
    @State var isNew = false
    @State var selection: String = ""

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
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
            }
            .onAppear { eventCopy = event }
            .navigationBarTitle("", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    if isNew {
                        Button("Cancel") { dismiss() }
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(isNew ? "Add" : "Save") { isNew ? addEvent(event: eventCopy) : saveEvent() }
                        .disabled(eventCopy.title.isEmpty)
                }
            }
            .background(Color(UIColor.secondarySystemBackground))

            Button(role: .destructive, action: {
                event.isDeleted = true
                dismiss()
            }, label: {
                Text("Delete Event").foregroundColor(Color(UIColor.systemRed))
            })
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.vertical)
            .background(.white.opacity(0.7))
            .overlay(Divider(), alignment: .top)
            .overlay(Divider(), alignment: .bottom)
        }
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EventDetailView(event: .constant(Event.example)).environmentObject(EventStore())
        }
    }
}
