import SwiftUI

@main
struct SafarKitApp: App {
    @State private var appStartState: AppState = .splashscreen
    var body: some Scene {
        WindowGroup {
            switch appStartState {
            case .splashscreen:
                SplashScreen(appStartState: $appStartState)
            case .home:
                ContentView()
            }
        }
    }
}
