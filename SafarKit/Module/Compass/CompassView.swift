import SwiftUI
import LocationService

struct CompassView: View {
    @EnvironmentObject var locationManager: LocationService
    var body: some View {
        VStack() {
            Spacer()
            SunView(degrees: locationManager.degrees)
            Spacer()
            HStack(alignment: .center, spacing: 16) {
                HStack(alignment: .top, spacing: 4) {
                    Text("27")
                        .font(.custom("", size: 82))
                    Text("O")
                        .font(.custom("", size: 20))
                        .offset(y: 12)
                }
                .foregroundColor(.orange)
                Spacer()
                VStack(alignment: .leading) {
                    Text("IT’S SUNNY!")
                        .bold()
                    Text("Good time to explore and be active outside")
                }
            }
        }
        .padding(.horizontal, 32)
        .padding(.vertical, 16)
    }
}

struct CompassView_Previews: PreviewProvider {
    static var previews: some View {
        CompassView()
    }
}
