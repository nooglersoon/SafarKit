import SwiftUI
import MapKit

struct ExploreView: View {
    @StateObject var locationManager = LocationManager()
    
    var region: Binding<MKCoordinateRegion>? {
        guard let location = locationManager.userLocation else {
            return MKCoordinateRegion.kaabahRegion().getBinding()
        }
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        return region.getBinding()
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.white
                VStack(spacing: 48) {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Hello, you are in")
                                .font(.system(size: 18, weight: .regular, design: .serif))
                                .foregroundColor(.black)
                            if let city = locationManager.userCity {
                                Text(city)
                                    .font(.system(size: 32, weight: .bold, design: .serif))
                                    .foregroundColor(.black)
                            } else {
                                Text("Bandung")
                                    .font(.system(size: 32, weight: .bold, design: .serif))
                                    .foregroundColor(.black)
                            }
                        }
                        .padding(32)
                        Spacer()
                    }
                    Spacer()
                }
                ZStack(alignment: .center) {
                    Circle()
                        .foregroundColor(.init(red: 72/255, green: 108/255, blue: 91/255))
                        .frame(width: geo.size.width * 0.85)
                    ZStack(alignment: .center) {
                        Circle()
                            .foregroundColor(.clear)
                            .frame(width: geo.size.width * 0.75)
                            .overlay(
                                ZStack {
                                    RoundedRectangle(cornerRadius: geo.size.width * 0.75)
                                        .stroke(.white, lineWidth: 2)
                                }
                            )
                        Image("kaaba")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .offset(y: -(geo.size.width * 0.375))
                    }
                    .rotationEffect(Angle(degrees: self.locationManager.degrees))
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: geo.size.width * 0.6)
                    VStack(alignment: .center, spacing: 4) {
                        Text("Dzuhr")
                            .font(.system(size: 32, weight: .semibold, design: .serif))
                            .foregroundColor(.AppColors.MainGreen.main)
                        Text("12:15")
                            .font(.system(size: 28, weight: .semibold, design: .serif))
                            .foregroundColor(.black)
                        Text("Local Time")
                            .font(.system(size: 16, weight: .regular, design: .serif))
                            .foregroundColor(.black)
                    }
                    .padding(.horizontal, 32)
                }
                .padding(.horizontal, 16)
                VStack {
                    Spacer()
                    ShalatReminderBadgesView()
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
