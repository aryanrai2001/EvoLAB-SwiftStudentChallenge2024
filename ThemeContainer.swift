import SwiftUI

struct ThemeContainer: View {
    var width: CGFloat
    var height: CGFloat
    var content: any View
    var body: some View {
        ZStack{
            
            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                .frame(width: width, height: height)
                .foregroundColor(.white)
                .shadow(color: .accentColor, radius: 0, x: 0, y: 5)
            
            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                .stroke()
                .frame(width: width, height: height)
                .foregroundColor(.accentColor)
            
            AnyView(content)
        }
    }
}

#Preview {
    ThemeContainer(width: 100, height: 100, content: Text("Test"))
}
