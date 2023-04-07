import Foundation
import CoreLocation

public protocol QiblaFinderInterface {
    func updateCompass(
        origin: CLLocationCoordinate2D,
        target: CLLocationCoordinate2D,
        heading: CLHeading) -> Double
    func getAngleBetweenPoints(origin: CLLocationCoordinate2D, target: CLLocationCoordinate2D) -> Double
    func getAngleFromHeading(heading: CLHeading) -> Double
}
