import SwiftUI

struct InfoView: View {
    @Binding var infoActive:Bool
    private let aboutSection = """
    This application is developed by Aryan Rai, as a submission for the Swift Student Challenge 2024.
    The goal of this simulation application is to teach people about the process of evolution by natural selection using a simple analogy.
    """
    private let workSection = """
    This is a grid-based simulation where we will start by defining a few parameters for our “Environment” and then we will specify a goal for our simulation. After that, a randomly generated population will start evolving. Through natural selection, the population will slowly converge on our specified goal.
    """
    private let conditionSection = """
    -Self-Replication
    -Genome
    -Inheritance
    -Mutation
    -Natural Selection
    """
    private let genomeSection = """
    Lower 16 bits -

    Colour:
    0000 0000 0000 00 [00]

    Shape:
    0000 0000 0000 [00] 00

    Food Colour Preference:
    0000 0000 00 [00] 0000

    Food Shape Preference:
    0000 0000 [00] 00 0000

    Y Position on Grid
    0000 0 [000] 0000 0000

    X Position on Grid
    00 [000] 000 0000 0000

    Redundant
    [00] 00 0000 0000 0000


    Higher 16 bits -

    Health:
    1000 0000 [0000 0000]
    """
    private let infoText = """











"""
    
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
                    
                    Text("About")
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .foregroundColor(.accentColor)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text(aboutSection)
                        .multilineTextAlignment(.leading)
                        .padding(10)
                        .foregroundColor(.accentColor)
                        .font(.headline)
                        .fontWeight(.light)
                    
                    Text("How it works?")
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .foregroundColor(.accentColor)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    
                    Text(workSection)
                        .multilineTextAlignment(.leading)
                        .padding(10)
                        .foregroundColor(.accentColor)
                        .font(.headline)
                        .fontWeight(.light)
                    
                    Text("Conditions for Evolution")
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .foregroundColor(.accentColor)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text(conditionSection)
                        .multilineTextAlignment(.leading)
                        .padding(10)
                        .foregroundColor(.accentColor)
                        .font(.headline)
                        .fontWeight(.light)
                    
                    
                    Text("Genome Structure")
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .foregroundColor(.accentColor)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text(genomeSection)
                        .multilineTextAlignment(.leading)
                        .padding(10)
                        .foregroundColor(.accentColor)
                        .font(.headline)
                        .fontWeight(.light)
                    
                }
                .frame(width: 300, height: 500)
                .border(Color.accentColor)
        })
    }
}

#Preview {
    InfoView(infoActive: Binding.constant(true))
}
