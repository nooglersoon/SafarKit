import SwiftUI
import MapKit

struct MainMapView: View {
    @Binding var region: MKCoordinateRegion
    var body: some View {
        GeometryReader { geo in
            Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: .none)
                .frame(width: geo.size.width, height: geo.size.width)
                .cornerRadius(geo.size.width/2)
                .allowsHitTesting(false)
        }
    }
}
