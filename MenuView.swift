import SwiftUI

struct MenuView: View {
    
    @State private var infoActive = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Image("logo")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .padding([.top, .leading, .trailing], 25)
                    
                    NavigationLink(destination: GameView()) {
                        
                        ZStack {
                            
                            Circle()
                                .foregroundColor(.white)
                                .shadow(color: .accentColor, radius: 0, x: 0, y: 10)
                            
                            Circle()
                                .stroke()
                                .foregroundColor(.accentColor)
                            
                            Text("Evolve!")
                                .font(.largeTitle)
                                .fontWeight(.thin)
                                .foregroundColor(.accentColor)
                                .multilineTextAlignment(.center)
                            
                        }
                        
                    }.padding(75)
                    
                    Spacer()
                    
                    HStack {
                        ThemeContainer(width: 75, height: 75, content: Image(systemName: "gearshape")
                            .font(.system(size: 40))
                            .fontWeight(.thin)
                            .foregroundColor(.accentColor))
                        .padding()
                        
                        Spacer()
                        
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.25)){
                                infoActive = true
                            }
                        }, label: {
                            ThemeContainer(width: 75, height: 75, content: Text("Info")
                                .font(.largeTitle)
                                .fontWeight(.thin)
                                .foregroundColor(.accentColor)
                                .multilineTextAlignment(.center))
                            .padding()
                        })
                        .disabled(infoActive)
                        
                    }
                    Spacer()
                }.blur(radius: infoActive ? 8 : 0)
                
                if (infoActive) {
                    InfoView(infoActive: $infoActive)
                        .transition(.move(edge: .bottom))
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MenuView()
}
