import SwiftUI

struct TabIndicator: View {
    @Binding var selectedIndex: Int
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<3) { index in
                Rectangle()
                    .foregroundColor( selectedIndex == index ? .black : .gray)
                    .frame(height: 6)
            }
        }
    }
}
