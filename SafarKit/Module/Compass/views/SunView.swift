import SwiftUI

struct SunView: View {
    
    let degrees: Double
    
    init(degrees: Double) {
        self.degrees = degrees
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Circle()
                    .stroke(Color.orange, lineWidth: 3)
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
                    EquilateralTriangle()
                        .fill(Color.orange)
                        .frame(width: 30, height: 20)
                        .offset(y: -(geo.size.width * 0.4))
                }
                .rotationEffect(Angle(degrees: degrees))
            }
        }
    }
}

struct EquilateralTriangle: Shape {
    func path(in rect: CGRect) -> Path {
            var path = Path()
            
            // Define the points of the triangle's vertices
            let topPoint = CGPoint(x: rect.midX, y: rect.minY)
            let leftPoint = CGPoint(x: rect.minX, y: rect.maxY)
            let rightPoint = CGPoint(x: rect.maxX, y: rect.maxY)
            
            // Move to the top point to start drawing the triangle
            path.move(to: topPoint)
            
            // Draw lines to the left and right points
            path.addLine(to: leftPoint)
            path.addLine(to: rightPoint)
            
            // Close the path to complete the triangle
            path.closeSubpath()
            
            return path
        }
}

struct SunView_Previews: PreviewProvider {
    static var previews: some View {
        SunView(degrees: 180)
            .padding(32)
    }
}
