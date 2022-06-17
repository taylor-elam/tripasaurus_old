import SwiftUI

struct EventListView: View {
    @EnvironmentObject var eventStore: EventStore

    var body: some View {
        List {
            ForEach(EventSection.allCases) { section in
                if !eventStore.sortedEvents(section: section).isEmpty {
                    Section(content: {
                        ForEach(eventStore.sortedEvents(section: section)) { $event in
                            NavigationLink {
                                EventDetailView(event: $event)
                            } label: {
                                EventRow(event: $event)
                            }
                        }
                    }, header: {
                        Text(section.name)
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                    })
                }
            }
        }
    }
}

struct EventListView_Previews: PreviewProvider {
    static var previews: some View {
        EventListView().environmentObject(EventStore())
    }
}
