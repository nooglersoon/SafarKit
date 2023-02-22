import Foundation
import CoreLocation

struct UserLocationModel: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}
