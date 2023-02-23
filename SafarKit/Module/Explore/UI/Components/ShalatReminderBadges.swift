import SwiftUI

struct ShalatReminderBadgesView: View {
    var body: some View {
        HStack {
            MiniProductButtonView(productImage: Image("bell"))
//            VStack(alignment: .center, spacing: 4) {
//                Text("Dzuhr")
//                    .font(.system(size: 32, weight: .semibold, design: .serif))
//                    .foregroundColor(.AppColors.MainGreen.main)
//                Text("12:15")
//                    .font(.system(size: 28, weight: .semibold, design: .serif))
//                    .foregroundColor(.black)
//                Text("Local Time")
//                    .font(.system(size: 16, weight: .regular, design: .serif))
//                    .foregroundColor(.black)
//            }
//            .padding(.horizontal, 32)
            MiniProductButtonView(productImage: Image("dua"))
        }
        .padding(24)
    }
}

struct ShalatReminderBadges_Previews: PreviewProvider {
    static var previews: some View {
        ShalatReminderBadgesView()
    }
}
