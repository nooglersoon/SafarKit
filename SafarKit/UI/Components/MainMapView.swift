import SwiftUI
import MapKit

struct MainMapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 40.83834587046632,
            longitude: 14.254053016537693),
        span: MKCoordinateSpan(
            latitudeDelta: 0.03,
            longitudeDelta: 0.03)
    )
    var body: some View {
        GeometryReader { geo in
            Map(coordinateRegion: $region)
                .frame(width: geo.size.width, height:  geo.size.width)
                .cornerRadius(geo.size.width/2)
                .allowsHitTesting(false)
        }
    }
}

struct MainMapView_Previews: PreviewProvider {
    static var previews: some View {
        MainMapView()
    }
}
