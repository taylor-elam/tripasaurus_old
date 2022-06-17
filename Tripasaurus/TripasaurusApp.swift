import SwiftUI

@main
struct TripasaurusApp: App {
    @State private var id = UUID()
    @State private var tabSelection = 0

    var handler: Binding<Int> { Binding(
        get: { self.tabSelection },
        set: {
            self.id = UUID()
            self.tabSelection = $0
        }
    ) }

    var body: some Scene {
        WindowGroup {
            TabView {
                ForEach(AppTab.allCases) { tab in
                    NavigationView {
                        tab.content
                            .navigationTitle(tab.title)
                            .id(id)
                    }
                    .navigationViewStyle(.stack)
                    .tabItem { Label(tab.title, systemImage: tab.icon) }
                    .tag(tab.tag)
                }
            }
        }
    }
}
