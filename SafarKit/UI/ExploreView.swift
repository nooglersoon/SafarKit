import SwiftUI

struct ExploreView: View {
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
                            Text("Naples")
                                .font(.system(size: 28, weight: .semibold, design: .serif))
                                .foregroundColor(.black)
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
                            .frame(width: geo.size.width * 0.7)
                            .overlay(
                                ZStack {
                                    RoundedRectangle(cornerRadius: geo.size.width * 0.7)
                                        .stroke(.white, lineWidth: 2)
                                        .opacity(0.35)
                                }
                            )
                        Image("kaaba")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .offset(y: -(geo.size.width * 0.35))
                    }
                    .rotationEffect(Angle(degrees: 30))
                    MainMapView()
                        .frame(width: geo.size.width * 0.5, height: geo.size.width * 0.5)
                        .padding(4)
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
