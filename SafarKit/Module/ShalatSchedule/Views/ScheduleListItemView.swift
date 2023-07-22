import SwiftUI

struct ScheduleListItemView: View {
    
    let viewModel: ScheduleListItemViewModel
    
    var time: [String] {
        viewModel.time.components(separatedBy: ":")
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottom) {
                HStack(alignment: .bottom, spacing: 4) {
                    Text(viewModel.name.uppercased())
                        .font(.custom("", size: 40))
                        .offset(y: -6)
                    Spacer()
                    HStack(alignment: .top) {
                        Text(time[0])
                            .font(.custom("", size: 72))
                        Text(time[1])
                            .font(.largeTitle)
                    }
                }
                .padding(.horizontal, 16)
                .frame(maxHeight: 120)
                
                DottedLine()
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [5])) // Adjust the lineWidth and dash as needed
                    .frame(height: 1)
                    .foregroundColor(.black).opacity(0.4)
            }
            .frame(width: geo.size.width)
        }
    }
}

struct ScheduleListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleListItemView(viewModel: .init(name: "MAGHRIB", time: "05:30"))
    }
}
