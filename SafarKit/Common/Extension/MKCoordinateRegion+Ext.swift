import SwiftUI
import MapKit

extension MKCoordinateRegion {
    
    static func kaabahRegion() -> MKCoordinateRegion {
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 21.4225, longitude: 39.8262), latitudinalMeters: 5000, longitudinalMeters: 5000)
    }
    
    func getBinding() -> Binding<MKCoordinateRegion>? {
        return Binding<MKCoordinateRegion>(.constant(self))
    }
}

