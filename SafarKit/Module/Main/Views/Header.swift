import SwiftUI

struct Header: View {
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text("Hello,")
                    .font(.title3)
                Text("BANDUNG")
                    .font(.largeTitle)
                    .bold()
                    .lineLimit(1)
            }
            Spacer()
            Text("ID")
                .font(.custom("", size: 64))
                .frame(width: 100)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 24)
    }
}
