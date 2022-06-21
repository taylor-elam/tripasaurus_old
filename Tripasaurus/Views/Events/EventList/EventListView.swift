import SwiftUI

struct EventListView: View {
    @EnvironmentObject var eventStore: EventStore
    @State var isAddingNewEvent = false
    @State var newEvent = Event()

    var body: some View {
        List {
            ForEach(EventSection.allCases) { section in
                if !eventStore.sortedEvents(section: section).isEmpty {
                    Section(content: {
                        ForEach(eventStore.sortedEvents(section: section)) { $event in
                            NavigationLink(
                                destination: { EventDetailView(event: $event) },
                                label: { EventRow(event: $event) }
                            )
                            .swipeActions(edge: .leading) { CopyButton(action: { copy(event: event) }) }
                            .swipeActions { DeleteButton(action: { event.isDeleted = true }) }
                        }
                    }, header: { Text(section.name).sectionHeaderStyle() })
                }
            }
        }
        .listStyle(SidebarListStyle())
        .toolbar {
            ToolbarItem {
                Button(
                    action: addNewEvent,
                    label: { Label(LocalizedStringKey(EventVault.add.name), systemImage: AppSymbol.addNew.name) }
                )
            }
        }
        .sheet(isPresented: $isAddingNewEvent) {
            NavigationView {
                EventDetailView(event: $newEvent, isNew: true)
            }
        }
    }
}

struct EventListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EventListView().environmentObject(EventStore())
        }
    }
}
