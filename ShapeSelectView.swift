import SwiftUI

struct ShapeSelectView: View {
    
    @Binding var value: Int
    
    var body: some View {
        VStack {
            
            Text("Specimen Shape")
                .font(.title3)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundColor(.accentColor)
            
            HStack {
                
                if (value > 0) {
                    Button(action: {
                        value -= 1
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
                
                if (value < 0) {
                    ThemeContainer(width: 175, height: 175, content:Text(""))
                }
                else
                {
                    ThemeContainer(width: 175, height: 175, content:Image(systemName: GameView.shapes[value])
                        .font(.system(size: 100))
                                        .foregroundColor(.accentColor))
                    
                }
                if (value < GameView.shapes.count - 1) {
                    Button(action: {
                        value += 1
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
    GameView()
}
