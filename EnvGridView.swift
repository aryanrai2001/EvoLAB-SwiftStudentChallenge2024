import SwiftUI

struct EnvGridView: View {
    
    let gridSize: Int
    let cellSize: CGFloat
    @Binding var grid:[[Int]]
    
    init(gridSize: Int, grid: Binding<[[Int]]>) {
        self.gridSize = gridSize
        self._grid = grid
        self.cellSize = CGFloat(350/gridSize)
    }
    
    var body: some View {
        VStack(spacing: 0) {
                ForEach(0..<gridSize, id:\.self) { y in
                    HStack(spacing: 0) {
                        ForEach(0..<gridSize, id:\.self) { x in
                            
                            ZStack {
                                RoundedRectangle(cornerSize: CGSize(width:  cellSize/10, height: cellSize/10))
                                    .stroke()
                                    .frame(width: cellSize, height: cellSize)
                                    .foregroundColor(.accentColor)
                                
                                EnvCell(value: grid[y][x], size: cellSize)
                            }
                        }
                    }
                }
        }
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
