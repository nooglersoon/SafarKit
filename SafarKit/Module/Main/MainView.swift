import SwiftUI
import LocationService

struct MainView: View {
    @EnvironmentObject var locationManager: LocationService
    @State var selection = 1
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Header(city: locationManager.userCity ?? "N/A")
            TabIndicator(selectedIndex: $selection)
            TabView(selection: $selection) {
                CollageView()
                    .tag(0)
                CompassView()
                    .tag(1)
                ShalatScheduleView()
                    .tag(2)
            }
            .tabViewStyle(.page)
            .onAppear {
              setupAppearance()
            }
        }
    }
    
    func setupAppearance() {
        UIPageControl.appearance().isHidden = true
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
