import Foundation
import CoreLocation
import MapKit

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var degrees: Double = .zero
    @Published var userLocation: CLLocation?
    @Published var userRegion: MKCoordinateRegion = .init()
    
    private let kabah = CLLocationCoordinate2D(latitude: 21.4225, longitude: 39.8262)
    private let locationManager: CLLocationManager
    
    override init() {
        self.locationManager = CLLocationManager()
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.setup()
    }
    
    private func setup() {
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.headingAvailable() {
            self.locationManager.startUpdatingLocation()
            self.locationManager.startUpdatingHeading()
            guard let newLocation = self.locationManager.location else { return }
            self.userLocation = newLocation
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        guard let userLocation else { return }
        self.degrees = updateCompass(origin: userLocation.coordinate, target: kabah, heading: newHeading)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let newLocation = locations.last else { return }
        DispatchQueue.main.async {
            self.userLocation = newLocation
            self.userRegion = MKCoordinateRegion(
                center: newLocation.coordinate,
                span: MKCoordinateSpan(
                    latitudeDelta: 0.05,
                    longitudeDelta: 0.05)
            )
        }
    }
    
    func updateCompass(origin: CLLocationCoordinate2D, target:CLLocationCoordinate2D, heading: CLHeading) -> Double {
        let angleBetweenPoints = getAngleBetweenPoints(origin: origin, target: target)
        let angleFromHeading = getAngleFromHeading(heading: heading)
        let radian = .pi * (angleBetweenPoints + angleFromHeading) / 180.0
        let res =  radiansToDegrees(radian)
        return res
    }
    
    func getAngleBetweenPoints(origin:CLLocationCoordinate2D, target: CLLocationCoordinate2D) -> Double {
        let angle = 270 - (atan2(origin.latitude - target.latitude, origin.longitude - target.longitude)) * 180 / .pi
        return angle.truncatingRemainder(dividingBy: 360)
    }
    
    func getAngleFromHeading(heading:CLHeading) -> Double {
        let angle = -heading.magneticHeading / 180.0 * .pi
        return angle * (180.0 / .pi)
    }
    
    // Helpers
    
    private func degreesToRadians(_ degrees: Double) -> Double { return degrees * Double.pi / 180.0 }
    
    private func radiansToDegrees(_ radians: Double) -> Double { return radians * 180.0 / Double.pi }
    
}
