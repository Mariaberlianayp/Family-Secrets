//
//  finishView.swift
//  FS-Offline
//
//  Created by Maria Berliana on 05/05/23.
//

import SwiftUI

struct finishView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var tempPlayer: String = UserDefaults.standard.string(forKey: "tempPlayer") ?? "Player 1"
    @State private var backHome = false
    var vm: OfflineGameViewModel
    
    init(vm: OfflineGameViewModel) {
        self.vm = vm
    }
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    if let player = vm.players.filter({ $0.username == tempPlayer }).first {
                        Image(player.avatar)
                    }
                    Text(tempPlayer)
                        .fontWeight(.heavy)
                        .background(Image("bgName"))
                        .padding(.top, 130.0)
                        .foregroundColor(Color("DarkBlue"))
                }.padding(.top, 90.0)
                
                NavigationLink(
                    destination: choosePlayerView(vm:vm),
                    isActive: $backHome,
                    label: {
                        Text("MAIN MENU")
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                            .onTapGesture {playMusic(music: "ButtonSound", loop: 0, volume: 0.5); backHome = true}
                            .background(Image("Button2"))
                            .padding(.top, 50.0)
                            .padding(.leading, 550.0)
                    }
                )
            }.background(Image("BGwinner"))
            .onAppear{
                if backHome{
                    backHome = false
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarBackButtonHidden(true)
        
    }
}

struct finishView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = CoreDataManager.shared.persistentStoreContainer.viewContext
        finishView(vm: OfflineGameViewModel(context: viewContext)).previewInterfaceOrientation(.landscapeRight)
    }
}
