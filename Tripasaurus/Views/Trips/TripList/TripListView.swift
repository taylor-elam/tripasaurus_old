import SwiftUI

struct TripListView: View {
    @EnvironmentObject var tripStore: TripStore

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TripListView_Previews: PreviewProvider {
    static var previews: some View {
        TripListView().environmentObject(TripStore())
    }
}
