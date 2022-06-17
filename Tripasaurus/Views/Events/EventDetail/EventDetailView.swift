import SwiftUI

struct EventDetailView: View {
    @Binding var event: Event
    @State var selection: String = ""

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                TitleSection(
                    color: $event.color,
                    icon: $event.icon,
                    title: $event.title,
                    isSelected: selection == "Icon",
                    selectRow: selectDeselect
                )
                DateSection(date: $event.date, isSelected: selection == "Date", selectRow: selectDeselect)
                TaskSection(tasks: $event.tasks)
            }
            .navigationBarTitle("", displayMode: .inline)
            .background(Color(UIColor.secondarySystemBackground))
        }
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(event: .constant(Event.example))
    }
}
