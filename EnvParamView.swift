import SwiftUI

struct EnvParamView: View {
    @Binding var population: Int
    @Binding var steps: Int
    @Binding var mutationRate: Int
    let gridSize: Int
    
    private static let minSteps: Int = 150
    private static let maxSteps: Int = 450
    private static let minMutationRate: Int = 5
    private static let maxMutationRate: Int = 100
    
    var body: some View {
        VStack (spacing: 0) {
            Spacer()
            Spacer()
            Spacer()
            Text("Population")
                .font(.title3)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundColor(.accentColor)
                .padding(.vertical, 20.0)
            
            HStack {
                if (population > 2)
                {
                Button(action: {
                        population -= 1
                }, label: {
                    
                    ThemeContainer(width: 40, height: 50, content: Image(systemName: "arrowtriangle.left.fill")
                        .fontWeight(.thin)
                        .font(.title3)
                        .foregroundColor(.accentColor))
                })
                    
                }
                else {
                    Rectangle()
                        .frame(width: 40, height: 50)
                        .foregroundColor(.white)
                }
                StrokeText(text: "\(population)", width: 0.5, color: .accentColor)
                            .foregroundColor(.white)
                            .font(.system(size: 60, weight: .heavy))
                            .shadow(color: .accentColor, radius: 0, x: 0, y: 5)
                            .padding(.horizontal, 50)
                
                
                    if (population < gridSize)
                {
                        Button(action: {
                            population += 1
                        }, label: {
                            
                            ThemeContainer(width: 40, height: 50, content: Image(systemName: "arrowtriangle.right.fill")
                                .fontWeight(.thin)
                                .font(.title3)
                                .foregroundColor(.accentColor))
                        })
                    }
                else {
                    Rectangle()
                        .frame(width: 40, height: 50)
                        .foregroundColor(.white)
                }
            }
            
            
            
            
                Spacer()
            Text("Steps/Generation")
                .font(.title3)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundColor(.accentColor)
                .padding(.vertical, 20)
            
            HStack {
                if (steps > EnvParamView.minSteps)
                {
                Button(action: {
                        steps -= 30
                }, label: {
                    
                    ThemeContainer(width: 40, height: 50, content: Image(systemName: "arrowtriangle.left.fill")
                        .fontWeight(.thin)
                        .font(.title3)
                        .foregroundColor(.accentColor))
                })
                    
                }
                else {
                    Rectangle()
                        .frame(width: 40, height: 50)
                        .foregroundColor(.white)
                }
                StrokeText(text: "\(steps)", width: 0.5, color: .accentColor)
                            .foregroundColor(.white)
                            .font(.system(size: 60, weight: .heavy))
                            .shadow(color: .accentColor, radius: 0, x: 0, y: 5)
                            .padding(.horizontal, 30)
                
                
                if (steps < EnvParamView.maxSteps)
                {
                        Button(action: {
                            steps += 30
                        }, label: {
                            
                            ThemeContainer(width: 40, height: 50, content: Image(systemName: "arrowtriangle.right.fill")
                                .fontWeight(.thin)
                                .font(.title3)
                                .foregroundColor(.accentColor))
                        })
                    }
                else {
                    Rectangle()
                        .frame(width: 40, height: 50)
                        .foregroundColor(.white)
                }
            }
            
            
            
                Spacer()
            Text("Mutation Rate")
                .font(.title3)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundColor(.accentColor)
                .padding(.vertical, 20)
            
            HStack {
                if (mutationRate > EnvParamView.minMutationRate)
                {
                Button(action: {
                    mutationRate -= 5
                }, label: {
                    
                    ThemeContainer(width: 40, height: 50, content: Image(systemName: "arrowtriangle.left.fill")
                        .fontWeight(.thin)
                        .font(.title3)
                        .foregroundColor(.accentColor))
                })
                    
                }
                else {
                    Rectangle()
                        .frame(width: 40, height: 50)
                        .foregroundColor(.white)
                }
                StrokeText(text: "\(Double(mutationRate)/100.0)", width: 0.5, color: .accentColor)
                    .font(.system(size: 60, weight: .heavy))
                            .foregroundColor(.white)
                            .shadow(color: .accentColor, radius: 0, x: 0, y: 5)
                            .padding(.horizontal, 30)
                
                
                if (mutationRate < EnvParamView.maxMutationRate)
                {
                        Button(action: {
                            mutationRate += 5
                        }, label: {
                            
                            ThemeContainer(width: 40, height: 50, content: Image(systemName: "arrowtriangle.right.fill")
                                .fontWeight(.thin)
                                .font(.title3)
                                .foregroundColor(.accentColor))
                        })
                    }
                else {
                    Rectangle()
                        .frame(width: 40, height: 50)
                        .foregroundColor(.white)
                }
            }
            
                Spacer()
            
                Spacer()
            
                Spacer()
            
                Spacer()
        }
    }
}

#Preview {
    EnvParamView(population: Binding.constant(4), steps: Binding.constant(360), mutationRate: Binding.constant(10), gridSize: 7)
}
