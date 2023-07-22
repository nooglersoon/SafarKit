import SwiftUI

struct MainView: View {
    @State var selection = 1
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Header()
            TabIndicator(selectedIndex: $selection)
            TabView(selection: $selection) {
                Color(.red)
                    .tag(0)
                Color(.green)
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
