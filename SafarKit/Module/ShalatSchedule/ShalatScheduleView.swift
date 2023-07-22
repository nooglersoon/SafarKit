import SwiftUI

struct ShalatScheduleView: View {
    
    let scheduleLists: [ScheduleListItemViewModel] = [
        .init(name: "FAJR", time: "04:25"),
        .init(name: "ZUHR", time: "11:49"),
        .init(name: "ASHR", time: "15:20"),
        .init(name: "MAGHRIB", time: "17:50"),
        .init(name: "ISYA", time: "18:58")
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(scheduleLists, id: \.uuid) { viewModel in
                    ScheduleListItemView(viewModel: viewModel)
                        .frame(height: 120)
                }
            }
        }
    }
}

struct ShalatScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ShalatScheduleView()
    }
}
