import SwiftUI

struct EnvFoodView: View {
    
    let gridSize: Int
    let cellSize: CGFloat
    @Binding var food:[[Bool]]
    
    init(gridSize: Int, food: Binding<[[Bool]]>) {
        self.gridSize = gridSize
        self._food = food
        self.cellSize = CGFloat(350/gridSize)
    }
    
    var body: some View {
        VStack(spacing: 0) {
                ForEach(0..<gridSize, id:\.self) { y in
                    HStack(spacing: 0) {
                        ForEach(0..<gridSize, id:\.self) { x in
                            
                            ZStack {
                                RoundedRectangle(cornerSize: CGSize(width:  cellSize/10, height: cellSize/10)).frame(width: cellSize, height: cellSize)
                                    .opacity(0)
                                
                                if (food[y][x]) {
                                    Image(systemName: GameView.shapes[(GameView.genome >> 2) & 3] + ".fill")
                                        .font(.system(size: cellSize * 0.25))
                                        .fontWeight(.heavy)
                                        .foregroundColor(GameView.colors[GameView.genome & 3])
                                }
                            }
                        }
                    }
                }
        }
    }
}

#Preview {
    EnvFoodView(gridSize: 5, food: Binding.constant([
        [false, false, false, false, false, false, false, false, false],
        [false, false, false, false, false, false, false, false, false],
        [false, false, false, false, false, false, false, false, false],
        [false, false, false, false, false, false, false, false, false],
        [false, false, false, false, false, false, false, false, false],
        [false, false, false, false, false, false, false, false, false],
        [false, false, false, false, false, false, false, false, false],
        [false, false, false, false, false, false, false, false, false],
        [false, false, false, false, false, false, false, false, false]
    ]))
}
