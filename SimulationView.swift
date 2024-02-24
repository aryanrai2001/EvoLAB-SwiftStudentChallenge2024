import SwiftUI

struct SimulationView: View {
    
    var size: Int
    var steps: Int
    var muataionRate: Int
    
    @State var genome: Int
    @State var population: Int
    
    @Binding var endActive: Bool
    
    @State private var gen = 0
    @State private var step = 0
    @State private var pause = true
    @State private var fast = false
    @State private var genFinished = false
    
    private static let timerSlow = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    private static let timerFast = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    private static var timer = timerSlow
    
    @State var grid = [
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0]
    ]
    
    @State var food = [
        [false, false, false, false, false, false, false, false, false],
        [false, false, false, false, false, false, false, false, false],
        [false, false, false, false, false, false, false, false, false],
        [false, false, false, false, false, false, false, false, false],
        [false, false, false, false, false, false, false, false, false],
        [false, false, false, false, false, false, false, false, false],
        [false, false, false, false, false, false, false, false, false],
        [false, false, false, false, false, false, false, false, false],
        [false, false, false, false, false, false, false, false, false]
    ]
    
    @State var creatures:Array<Int> = Array()
    
    func getDir( x:Int, y:Int) -> [Int] {
        var newX: Int
        var newY: Int
        repeat {
            let dir = Int.random(in: 0...7)
            var dx = size
            var dy = size
            
            switch (dir) {
            case 0:
                dy += 1
                break
            case 1:
                dy += 1
                dx += 1
                break
            case 2:
                dx += 1
                break
            case 3:
                dx += 1
                dy += -1
                break
            case 4:
                dy += -1
                break
            case 5:
                dy += -1
                dx += -1
                break
            case 6:
                dx += -1
                break
            case 7:
                dx += -1
                dy += 1
                break
            default:
                break
            }
            
            newX = (x+dx)%size
            newY = (y+dy)%size
        } while (grid[newY][newX] != 0)
        return [newX, newY]
    }
    
    func tick() {
        for i in 0..<size {
            for j in 0..<size {
                grid[i][j] = 0
            }
        }
        for i in 0..<creatures.count {
            var currGene = creatures[i]
            let vals = currGene & 0xf
            var health = (currGene >> 16) & 0xff
            var y = (currGene >> 8) & 0x7
            var x = (currGene >> 11) & 0x7
            
            let newPos = getDir(x: x, y: y)
            
            x = newPos[0]
            y = newPos[1]
            
            if (food[y][x]) {
                food[y][x] = false
                let diff = abs(vals - genome)
                health -= diff * 3
                if (health < 0) {
                    health = 0
                }
            }
            
            currGene = 0x80000000 |
            vals |
            (y << 8) |
            (x << 11) |
            (health << 16)
            creatures[i] = currGene
            grid[y][x] = currGene
        }
    }
    
    func spawnFood() {
        var x: Int
        var y: Int
        repeat{
            x = Int.random(in: 0..<size)
            y = Int.random(in: 0..<size)
        }while (food[y][x] == true)
        food[y][x] = true
    }
    
    func genLeap() {
        var children:Array<Int> = Array()
        let elim = Int(population / 2) + 1
        creatures.sort()
        for _ in 1...elim {
            children.append(creatures.popLast() ?? 0)
        }
        creatures.removeAll()
        for i in 0..<population-elim {
            var childGenome = children[i]
            if (Int.random(in: 1...100) <= muataionRate)
            {
                childGenome = childGenome ^ (1 << Int.random(in: 0...3))
            }
            creatures.append(childGenome)
        }
        creatures.append(contentsOf: children)
        tick()
        var total = 0
        for i in 0..<creatures.count {
            if (genome == (creatures[i] & 0xf)) {
                total += 1
            }
        }
        if (total > population/2) {
            EndView.gen = gen
            endActive.toggle()
        }
    }
    
    var body: some View {
        VStack (spacing: 0) {
            HStack (alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text("Step: \(step)")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.accentColor)
                        .onReceive(SimulationView.timer) { _ in
                            if (pause==false){
                                if (step < steps) {
                                    step += 1
                                    tick()
                                    if (step % 10 == 0) {
                                        spawnFood()
                                    }
                                }
                                else {
                                    gen += 1
                                    step = 0
                                    pause = true
                                    fast = false
                                    SimulationView.timer = SimulationView.timerSlow
                                    for i in 0..<size {
                                        for j in 0..<size {
                                            food[i][j] = false
                                        }
                                    }
                                    genFinished = true
                                }
                            }}
                    Text("Generation: \(gen)")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.accentColor)
                        .padding(.bottom, 20.0)
                }.padding(.leading, 20)
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Desired Genome: \(String(format:"%01X", genome))")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.accentColor)
                        .padding(.bottom, 20.0)
                }.padding(.trailing, 20)
            }
            
            ZStack {
                EnvGridView(gridSize: size, grid: $grid)
                EnvFoodView(gridSize: size, food: $food)
            }

            if (genFinished) {
                Button(action: {
                    genFinished = false
                    genLeap()
                }) {
                    ThemeContainer(width: 250, height: 75, content: Text("Finish Generation!")
                        .foregroundColor(.accentColor)
                        .font(.title))
                    .fontWeight(.light)
                }
                .padding(25)
            }
            else {
                HStack {
                    if (!pause)
                    {
                        Button(action: {
                            fast.toggle()
                            if (fast) {
                                SimulationView.timer = SimulationView.timerFast
                            }
                            else {
                                SimulationView.timer = SimulationView.timerSlow
                            }
                        }, label: {
                            if (fast) {
                                ZStack {
                                    RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                                        .stroke()
                                        .foregroundColor(.accentColor)
                                        .frame(width: 75, height: 50)
                                    
                                    Image(systemName: "forward.fill")
                                        .foregroundColor(.accentColor)
                                        .font(.largeTitle)
                                }
                                .offset(CGSize(width: 0, height: 3))
                            }
                            else {
                                ThemeContainer(width: 75, height: 50, content: Image(systemName: "forward.fill")
                                    .foregroundColor(.accentColor)
                                    .font(.largeTitle))
                            }
                        }).disabled(endActive)
                    }
                    else {
                        ZStack {
                            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                                .stroke()
                                .foregroundColor(.gray)
                                .frame(width: 75, height: 50)
                            
                            Image(systemName: "forward.fill")
                                .foregroundColor(.gray)
                                .font(.largeTitle)
                        }
                        .offset(CGSize(width: 0, height: 3))
                    }
                    Spacer()
                    
                    Button(action: {
                        pause.toggle()
                    },label: {
                        if (pause)
                        {
                            ThemeContainer(width: 75, height: 50, content: Image(systemName: "play.fill")
                                .foregroundColor(.accentColor)
                                .font(.largeTitle))
                        }
                        else
                        {
                            ThemeContainer(width: 75, height: 50, content: Image(systemName: "pause.fill")
                                .foregroundColor(.accentColor)
                                .font(.largeTitle))
                        }
                    }).disabled(endActive)
                }
                .padding(25)
            }
        }
        .onAppear(perform: {
            withAnimation(.easeInOut(duration: 0.25)){
                for _ in 1...population {
                    var x:Int
                    var y:Int
                    var vals:Int
                    repeat {
                        y = Int.random(in: 0..<size)
                        x = Int.random(in: 0..<size)
                    } while (grid[y][x] != 0)
                    repeat {
                        vals = Int.random(in: 0...0xf)
                    } while ( vals == genome )
                    grid[y][x] = 0x80ff0000 |
                    vals |
                    (y << 8) |
                    (x << 11)
                    creatures.append(grid[y][x])
                }
            }
        })
    }
}

#Preview {
    SimulationView(size: 5, steps: 240, muataionRate: 5, genome: 8, population: 2, endActive: Binding.constant(false))
}
