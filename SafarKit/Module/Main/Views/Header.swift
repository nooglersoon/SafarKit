import SwiftUI

struct Header: View {
    
    let city: String
    
    init(city: String) {
        self.city = city
    }
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text("Hello,")
                    .font(.title3)
                Text(city.uppercased())
                    .font(.largeTitle)
                    .bold()
                    .lineLimit(1)
            }
            Spacer()
            
            // MARK: The MVP version only available in Indonesia
            
            Text("ID")
                .font(.custom("", size: 64))
                .frame(width: 100)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 24)
    }
}
