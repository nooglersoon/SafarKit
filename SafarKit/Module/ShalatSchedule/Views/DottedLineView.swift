import SwiftUI

struct DottedLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let pattern: [CGFloat] = [16, 4] // Adjust the pattern to set the size of the dashes and gaps
        
        // Start drawing from the left edge of the rect
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        
        // Add line segments using the pattern array
        for index in stride(from: 0, to: rect.width, by: pattern.reduce(0, +)) {
            let from = CGPoint(x: rect.minX + index, y: rect.midY)
            let destination = CGPoint(x: min(rect.minX + index + pattern[0], rect.maxX), y: rect.midY)
            path.addLines([from, destination])
        }
        
        return path
    }
}
