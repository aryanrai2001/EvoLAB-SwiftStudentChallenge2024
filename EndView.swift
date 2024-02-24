import SwiftUI

struct EndView: View {
    @Binding var endActive:Bool
    @State public static var gen = 0
    private let infoText = "Info"
    
    var body: some View {
        ThemeContainer(width: 350, height: 375, content:
                        VStack(spacing: 10) {
            Text("Congratulations!!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.accentColor)
            Text("More than half the polulation evolved to achive the desired genome by the end of generation \(EndView.gen)!")
                .font(.title)
                .fontWeight(.light)
                .foregroundColor(.accentColor)
                .padding(.horizontal, 40)
                .padding(.vertical, 20)
                .multilineTextAlignment(.center)
            NavigationLink(destination: MenuView(), label: {
                ThemeContainer(width: 75, height: 50, content: Text("Menu")).padding(.bottom)
            })
        })
    }
}

#Preview {
    EndView(endActive: Binding.constant(true))
}
