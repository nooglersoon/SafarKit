import SwiftUI

struct MiniProductButtonView: View {
    let productImage: Image
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color.AppColors.MainGreen.main)
                .frame(width: 50, height: 50, alignment: .center)
            productImage
                .resizable()
                .frame(width: 20, height: 20, alignment: .center)
        }
    }
}

struct MiniProductButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MiniProductButtonView(productImage: Image("mecca"))
    }
}
