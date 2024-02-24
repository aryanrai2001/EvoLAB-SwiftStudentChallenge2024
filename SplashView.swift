import SwiftUI

struct SplashView: View {
    @State private var isActive: Bool = false
    var body: some View {
        ZStack {
            if self.isActive {
                MenuView()
            } else {
                Image("logo")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .padding(50)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
