import SwiftUI

struct GameView: View {
    
    @State private var endActive = false
    
    static let shapes = ["triangle", "diamond", "square", "pentagon"]
    static let colors = [Color.red, Color.blue, Color.black, Color.orange]
    
    @State var gameState = 0
    @State var shapeVal = 0
    @State var colorVal = 0
    @State var envSize = 3
    @State var population = 0
    @State var steps = 240
    @State var mutationRate = 10
    
    static var genome: Int = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                ZStack {
                    if (gameState < 2) {
                        Text("Choose Your\nStarting Conditions!")
                        
                    }
                    else if (gameState < 4) {
                        Text("Choose Your\nGoal!")
                    }
                }.font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.accentColor)
                
                Spacer()
                
                if (gameState == 0) {
                    EnvSelectView(value: $envSize)
                        .onDisappear(perform: {
                            population = envSize
                        })
                }
                else if (gameState == 1) {
                    EnvParamView(population: $population, steps: $steps, mutationRate: $mutationRate, gridSize: envSize)
                }
                else if (gameState == 2) {
                    ShapeSelectView(value: $shapeVal)
                }
                else if (gameState == 3) {
                    ColorSelectView(value: $colorVal, shape: shapeVal)
                }
                else if (gameState == 4) {
                    ZStack {
                        SimulationView(size: envSize, steps: steps, muataionRate: mutationRate, genome: ((shapeVal << 2) | colorVal), population: population, endActive: $endActive).onAppear(perform: {
                            GameView.genome = ((shapeVal << 2) | colorVal)
                        }).blur(radius: endActive ? 8 : 0)
                        
                        if (endActive) {
                            EndView(endActive: $endActive)
                                .transition(.move(edge: .bottom))
                        }
                    }
                }
                
                Spacer()
                
                if (gameState < 4) {
                    Button(action: {
                        gameState += 1
                    }, label: {
                        ThemeContainer(width: 175, height: 50, content: Text("Next").foregroundColor(.accentColor)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(.thin)).padding(.bottom, 100)
                    })
                }
                Spacer()
                
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    GameView()
}
