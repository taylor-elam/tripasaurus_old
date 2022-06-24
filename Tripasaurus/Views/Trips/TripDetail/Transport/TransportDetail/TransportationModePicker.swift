import SwiftUI

struct TransportationModePicker: View {
    @Binding var reservation: TransportReservation
    @State var isShowingModeButtons: Bool = false

    func setTransportationMode(mode: String) -> Void {
        reservation.mode = TransportationMode(icon: mode)
        isShowingModeButtons.toggle()
    }

    var body: some View {
        HStack {
            Button(action: { isShowingModeButtons.toggle() }, label: {
                HStack {
                    Text(reservation.mode.name)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .rotationEffect(Angle.degrees(isShowingModeButtons ? 180 : 0))
                        .animation(.easeInOut, value: isShowingModeButtons)
                }
            })
            .foregroundColor(.black)
            .frame(width: 70)

            ForEach(Array(TransportationMode.transportCases.enumerated()), id: \.offset) { offset, mode in
                IconButton(
                    icon: mode.icon,
                    background: mode == reservation.mode ? .black : .gray,
                    action: setTransportationMode
                )
                .offset(x: isShowingModeButtons ? 0 : -15)
                .scaleEffect(isShowingModeButtons ? 1 : 0, anchor: .center)
                .animation(
                    .interpolatingSpring(stiffness: 170, damping: 8)
                    .delay(
                        isShowingModeButtons
                        ? 0.1 * Double(offset + 1)
                        : 0.1 * (4 - Double(offset + 1))
                    ),
                    value: isShowingModeButtons
                )
            }
        }
    }
}

struct TransportationModePicker_Previews: PreviewProvider {
    static var previews: some View {
        TransportationModePicker(reservation: .constant(TransportReservation.transportExample))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
