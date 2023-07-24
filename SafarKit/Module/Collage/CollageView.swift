import SwiftUI

struct CollageView: View {
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    VStack(spacing: 0) {
                        Rectangle()
                            .foregroundColor(.blue)
                            .frame(height: geo.size.width*2/3)
                        Rectangle()
                            .foregroundColor(.green)
                            .frame(height: geo.size.width*1/3)
                        HStack(spacing: 0) {
                            Rectangle()
                                .foregroundColor(.orange)
                            Rectangle()
                                .foregroundColor(.white)
                        }
                    }
                    Rectangle()
                        .foregroundColor(.black)
                        .frame(width: geo.size.width/3)
                }
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(height: geo.size.height/5)
            }
        }
    }
}

struct CollageView_Previews: PreviewProvider {
    static var previews: some View {
        CollageView()
    }
}
