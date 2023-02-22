import SwiftUI

struct SplashScreen: View {
    @Binding var appStartState: AppState
    
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
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation(.easeOut(duration: 0.5)) {
                    self.appStartState = .home
                }
            }
        }
    }
}
