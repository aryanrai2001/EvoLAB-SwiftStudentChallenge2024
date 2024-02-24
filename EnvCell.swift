import SwiftUI

struct EnvCell: View {
    
    private var size: CGFloat
    private var shape: String
    private var color: Color
    
    init(value: Int, size: CGFloat) {
        self.size = size * 0.65
        if (value != 0) {
            self.shape = GameView.shapes[(value >> 2) & 3]
            self.color = GameView.colors[value & 3]
        }
        else {
            self.shape = "square.fill"
            self.color = Color.white
        }
    }
    
    var body: some View {
        Image(systemName: shape)
            .foregroundColor(color)
            .font(.custom("SF Pro", size: size))
            .transition(.move(edge: .bottom))
    }
}

#Preview {
    EnvGridView(gridSize: 5, grid: Binding.constant([
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0]
    ]))
}
