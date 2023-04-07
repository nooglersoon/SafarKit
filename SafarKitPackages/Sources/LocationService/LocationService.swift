import Foundation
import CoreLocation

public class LocationService: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    @Published public var degrees: Double = .zero
    @Published public var userLocation: CLLocation?
    @Published public var userCity: String?
    
    private let locationManager: CLLocationManager
    private let kaabahCoordinate: CLLocationCoordinate2D
    
    public init(
        locationManager: CLLocationManager,
        kaabahCoordinate: CLLocationCoordinate2D
    ) {
        self.locationManager = locationManager
        self.kaabahCoordinate = kaabahCoordinate
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
            self.reverseGeocoding(
                latitude: newLocation.coordinate.latitude,
                longitude: newLocation.coordinate.longitude)
        }
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let newLocation = locations.last else { return }
        DispatchQueue.main.async {
            self.userLocation = newLocation
        }
    }

    public func reverseGeocoding(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let geocoder = CLGeocoder()
        let location = CLLocation(latitude: latitude, longitude: longitude)
        geocoder.reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
            guard
                error == nil,
                let placemarks = placemarks,
                let placemark = placemarks.first,
                let city = placemark.locality
            else { return }
            self.userCity = city
        })
    }
}

extension LocationService: QiblaFinderInterface {
    
    public func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        guard let userLocation else { return }
        self.degrees = updateCompass(origin: userLocation.coordinate, target: kaabahCoordinate, heading: newHeading)
    }
    
    public func updateCompass(
        origin: CLLocationCoordinate2D,
        target: CLLocationCoordinate2D,
        heading: CLHeading) -> Double {
        let angleBetweenPoints = getAngleBetweenPoints(origin: origin, target: target)
        let angleFromHeading = getAngleFromHeading(heading: heading)
        let radian = .pi * (angleBetweenPoints + angleFromHeading) / 180.0
        let res =  radiansToDegrees(radian)
        return res
    }
    
    public func getAngleBetweenPoints(origin: CLLocationCoordinate2D, target: CLLocationCoordinate2D) -> Double {
        let angle = 270 - (atan2(origin.latitude - target.latitude, origin.longitude - target.longitude)) * 180 / .pi
        return angle.truncatingRemainder(dividingBy: 360)
    }
    
    public func getAngleFromHeading(heading: CLHeading) -> Double {
        let angle = -heading.magneticHeading / 180.0 * .pi
        return angle * (180.0 / .pi)
    }

    private func radiansToDegrees(_ radians: Double) -> Double { return radians * 180.0 / Double.pi }
    
}
