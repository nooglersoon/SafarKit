import SwiftUI
import LocationService
import MapKit

@main
struct SafarKitApp: App {
    @State private var appStartState: AppState = .splashscreen
    @StateObject var locationManager = LocationService(
        locationManager: CLLocationManager(),
        kaabahCoordinate: MKCoordinateRegion.kaabahRegion().center
    )
    var body: some Scene {
        WindowGroup {
            switch appStartState {
            case .splashscreen:
                SplashScreen(appStartState: $appStartState)
            case .home:
                ContentView()
                    .environmentObject(locationManager)
            }
        }
    }
}
