import SwiftUI

struct EnvSelectView: View {
    
    @Binding var value: Int
    
    var body: some View {
        VStack (spacing: 0) {
            Spacer ()
            Text("Environment Size")
                .font(.title3)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundColor(.accentColor)
                .padding(.bottom, 20)
            
            EnvGridView(gridSize: value, grid: Binding.constant([
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
            
            HStack {
                
                if (value > 3) {
                    Button(action: {
                        value -= 2
                    }, label: {
                        
                        ThemeContainer(width: 50, height: 75, content: Image(systemName: "arrowtriangle.left.fill")
                            .fontWeight(.thin)
                            .font(.largeTitle)
                            .foregroundColor(.accentColor))
                    })
                }
                else
                {
                    Rectangle()
                        .frame(width: 50, height: 75)
                        .foregroundColor(.white)
                }
                
                if (value < 3) {
                    ThemeContainer(width: 175, height: 175, content:Text(""))
                }
                else
                {
                    StrokeText(text: "\(value)", width: 0.5, color: .accentColor)
                                .foregroundColor(.white)
                                .font(.system(size: 100, weight: .heavy))
                                .shadow(color: .accentColor, radius: 0, x: 0, y: 5)
                    
                }
                if (value < 9) {
                    Button(action: {
                        value += 2
                    }, label: {
                        
                        ThemeContainer(width: 50, height: 75, content: Image(systemName: "arrowtriangle.right.fill")
                            .fontWeight(.thin)
                            .font(.largeTitle)
                            .foregroundColor(.accentColor))
                    })
                }
                else
                {
                    Rectangle()
                        .frame(width: 50, height: 75)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    EnvSelectView(value: Binding.constant(5))
}
