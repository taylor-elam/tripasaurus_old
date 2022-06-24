import SwiftUI

struct IconButton: View {
    var icon: String
    var background: Color
    var action: (String) -> Void

    var body: some View {
        Button {
            action(icon)
        } label: {
            Image(systemName: icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 15, height: 15)
                .foregroundColor(.white)
        }
        .frame(width: 25, height: 25)
        .background(background)
        .clipShape(Circle())
    }
}

struct IconButton_Previews: PreviewProvider {
    static var previews: some View {
        IconButton(icon: "airplane", background: .gray, action: { mode in })
            .previewLayout(.sizeThatFits)
    }
}
