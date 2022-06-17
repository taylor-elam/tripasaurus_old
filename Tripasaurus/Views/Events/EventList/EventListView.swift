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
                            NavigationLink {
                                EventDetailView(event: $event)
                            } label: {
                                EventRow(event: $event)
                            }
                            .swipeActions(edge: .leading) {
                                Button {
                                    copyEvent(event: event)
                                } label: {
                                    Label("Copy", systemImage: "doc.on.doc")
                                }
                                .tint(.purple)
                            }
                            .swipeActions {
                                Button(role: .destructive) {
                                    event.isDeleted = true
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
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
        .listStyle(SidebarListStyle())
        .toolbar {
            ToolbarItem {
                Button { addNewEvent() } label: { Label("Add Event", systemImage: "plus") }
            }
        }
        .sheet(isPresented: $isAddingNewEvent) {
            NavigationView {
                EventDetailView(event: $newEvent, isNew: true)
                    .navigationBarTitle(Text("New Event"), displayMode: .inline)
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
