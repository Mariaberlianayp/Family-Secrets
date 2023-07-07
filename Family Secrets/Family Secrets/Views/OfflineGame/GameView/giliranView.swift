//
//  giliranView.swift
//  FS-Offline
//
//  Created by Maria Berliana on 04/05/23.
//

import SwiftUI

struct giliranView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var tempPlayer: String = UserDefaults.standard.string(forKey: "tempPlayer") ?? "Player 1"
    @State var playerTotal: Int = UserDefaults.standard.integer(forKey: "playerTotal") ?? 3
    @State private var showOfflineGameView = false
    var vm: OfflineGameViewModel
    @State private var colors: [Color] = [Color("Yellow"), Color("Purple"), Color("LightBlue"), Color("LightGreen"), Color("PinkPastel"), Color("Peach"), Color("Pink")]
    init(vm: OfflineGameViewModel) {
        self.vm = vm
    }
    var body: some View {
        NavigationView{
            VStack{
                var tempPlayers:Int = (vm.extractInteger(from: tempPlayer) ?? 1) + 1
                if(tempPlayers-1 == playerTotal)
                {
                    ColoredTextView("GILIRAN PLAYER 1!", colors: colors)
                        .font(.custom(
                                "BIG-DAZZLE",
                                size: 48))
                }
                else{
                    ColoredTextView("GILIRAN PLAYER \(tempPlayers)!", colors: colors)
                        .font(.custom(
                                "BIG-DAZZLE",
                                size: 48))
                }
                
                NavigationLink(destination: OfflineGameView(vm: vm), isActive: $showOfflineGameView){
                    Button(action: {
                        playMusic(music: "ButtonSound", loop: 0, volume: 0.5)
                        showOfflineGameView = true
                    }) {
                        HStack{
                            Image(systemName: "play.fill")
                                .foregroundColor(Color("DarkBlue"))
                                .padding(.top, -5.0)
                            Text("MAIN")
                                .fontWeight(.heavy)
                                .foregroundColor(Color("DarkBlue"))
                                .padding(.top, -7.0)
                        }.background(Image("Button"))
                            .padding(.top, 50.0)
                    }
                }
            }.background(Image("BGglow"))
                
            
        }.navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
        .onAppear{
            if showOfflineGameView{
                showOfflineGameView = false
            }
        }
    }
}

struct giliranView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = CoreDataManager.shared.persistentStoreContainer.viewContext
        giliranView(vm: OfflineGameViewModel(context: viewContext)).previewInterfaceOrientation(.landscapeRight)
    }
}
