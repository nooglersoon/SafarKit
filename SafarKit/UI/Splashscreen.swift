import SwiftUI

struct SplashscreenView: View {
    var body: some View {
        ZStack {
            Color.init(red: 72/255, green: 108/255, blue: 91/255)
            VStack(alignment: .trailing) {
                Text("سفر")
                    .font(.system(size: 28, weight: .semibold, design: .serif))
                    .foregroundColor(.white)
                Text("SafarKit.")
                    .font(.system(size: 32, weight: .black, design: .serif))
                    .foregroundColor(.white)
            }
        }
        .ignoresSafeArea()
    }
}
