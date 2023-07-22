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
                Color(.blue)
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

struct TabIndicator: View {
    @Binding var selectedIndex: Int
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<3) { index in
                Rectangle()
                    .foregroundColor( selectedIndex == index ? .black : .gray)
                    .frame(height: 6)
            }
        }
    }
}

struct Header: View {
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text("Hello,")
                    .font(.title3)
                Text("BANDUNG")
                    .font(.largeTitle)
                    .bold()
                    .lineLimit(1)
            }
            Spacer()
            Text("ID")
                .font(.custom("", size: 64))
                .frame(width: 100)
        }
        .padding(.bottom, 16)
        .padding(.horizontal, 24)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
