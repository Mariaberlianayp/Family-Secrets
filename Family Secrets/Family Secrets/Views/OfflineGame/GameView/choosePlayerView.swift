import SwiftUI
import CoreData


struct choosePlayerView: View {
    @State var start: String = UserDefaults.standard.string(forKey: "isStart") ?? "yes"
    @State var playerTotal: Int = UserDefaults.standard.integer(forKey: "playerTotal") ?? 3
    @State private var showOfflineGameView = false
    @State var backToMenu: Bool = false
    @State var tempPlayer: String = UserDefaults.standard.string(forKey: "tempPlayer") ?? "Player 1"
    var vm: OfflineGameViewModel
    
    init(vm: OfflineGameViewModel) {
        self.vm = vm
    }
    @State private var onlineOffline = false
    
    var body: some View {
        NavigationView{
            VStack{
                
                NavigationLink(destination: OfflineGameView(vm: vm), isActive: $onlineOffline) {
                    Button() {
                        playMusic(music: "ButtonSound", loop: 0, volume: 0.5)
                        backToMenu = true
                    } label: {
                        BackButtonView()
                    }
                }.padding(.leading, -380.0)
                    .padding(.top, 30.0)
                Spacer()
                Text("BERAPA ORANG YANG AKAN BERMAIN?")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .heavy, design: .rounded))
                    .bold()
                
                Spacer()
                HStack{
                    
                    Button(action: {playMusic(music: "ButtonSound", loop: 0, volume: 0.5) ; playerTotal = 2 ; UserDefaults.standard.set(playerTotal, forKey: "playerTotal")}) {
                        Image("2_players")
                            .resizable()
                            .frame(width: playerTotal == 2 ? 162 : 132, height: playerTotal == 2 ? 197 : 167)
                    }.opacity(playerTotal == 2 ? 1.0 : 0.5)
                    
                    Button(action: {playMusic(music: "ButtonSound", loop: 0, volume: 0.5) ; playerTotal = 3 ; UserDefaults.standard.set(playerTotal, forKey: "playerTotal")}) {
                        Image("3_players")
                            .resizable()
                            .frame(width: playerTotal == 3 ? 162 : 132, height: playerTotal == 3 ? 197 : 167)
                    }.opacity(playerTotal == 3 ? 1.0 : 0.5)
                    Button(action: {playMusic(music: "ButtonSound", loop: 0, volume: 0.5) ; playerTotal = 4 ; UserDefaults.standard.set(playerTotal, forKey: "playerTotal")}) {
                        Image("4_players")
                            .resizable()
                            .frame(width: playerTotal == 4 ? 162 : 132, height: playerTotal == 4 ? 197 : 167)
                    }.opacity(playerTotal == 4 ? 1.0 : 0.5)
                }
                Spacer()
                NavigationLink(destination: OfflineGameView(vm: vm), isActive: $showOfflineGameView) {
                    Button(action: {
                        playMusic(music: "ButtonSound", loop: 0, volume: 0.5)
                        UserDefaults.standard.set("Player 1", forKey: "tempPlayer")
                        vm.asignPlayerCard(playerID: playerTotal)
                        vm.asignCardPlaying()
                        showOfflineGameView = true
                    }) {
                        ButtonView(width: 200, height: 40, text: "SELANJUTNYA", fontSize: 20)
                    }
                }.offset(CGSize(width: 290, height: -20))
                
            }.background(Image("Background"))
                .ignoresSafeArea()
            .onAppear{
                UserDefaults.standard.set("Player 1", forKey: "tempPlayer")
                    vm.save()
                    start = "no"
                    UserDefaults.standard.set(start, forKey: "isStart")
                vm.mixingCards()
                UserDefaults.standard.set("Player 1", forKey: "tempPlayer")
            }
            
        }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $backToMenu) {
                GameMenuView()
            }
    }
}

struct choosePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = CoreDataManager.shared.persistentStoreContainer.viewContext
        choosePlayerView(vm: OfflineGameViewModel(context: viewContext)).previewInterfaceOrientation(.landscapeRight)
    }
}
