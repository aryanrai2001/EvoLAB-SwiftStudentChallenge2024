import SwiftUI

struct InfoView: View {
    @Binding var infoActive:Bool
    private let infoText = "Info"
    
    var body: some View {
        ThemeContainer(width: 350, height: 600, content: 
            VStack {
                ZStack{
                    Text("Info")
                        .font(.largeTitle)
                        .fontWeight(.light)
                        .foregroundColor(.accentColor)
                        .underline()
                    HStack{
                        
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.20)){
                                infoActive = false
                            }
                        }, label: {
                            Image(systemName: "chevron.backward.circle")
                                .font(.largeTitle)
                                .fontWeight(.light)
                        }).padding(.horizontal, 40)
                        Spacer()
                    }
                }
                ScrollView{
                    Text(infoText)
                        .multilineTextAlignment(.leading)
                        .padding(10)
                        .foregroundColor(.accentColor)
                        .font(.headline)
                }
                .frame(width: 300, height: 500)
                .border(Color.accentColor)
        })
    }
}

#Preview {
    InfoView(infoActive: Binding.constant(true))
}
