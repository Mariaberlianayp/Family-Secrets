//
//  doTaskView.swift
//  FS-Offline
//
//  Created by Maria Berliana on 04/05/23.
//

import SwiftUI

struct doTaskView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var tempPlayer: String = UserDefaults.standard.string(forKey: "tempPlayer") ?? "Player 1"
    @State var playerTotal: Int = UserDefaults.standard.integer(forKey: "playerTotal") ?? 3
    @State private var showOfflineGameView = false
    
    @State var tempCardImage: String = UserDefaults.standard.string(forKey: "tempCardImage") ?? ""
    @State var tempCardPrompt: String = UserDefaults.standard.string(forKey: "tempCardPrompt") ?? ""
    @Binding var prompt: String
    @Binding var image: String
    
    var vm: OfflineGameViewModel
    
//    init(vm: OfflineGameViewModel) {
//        self.vm = vm
//    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack{
                    Text(tempPlayer)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("DarkBlue"))
                        .padding(.top, -7.0)
                }.background(Image("bgName2"))
                .padding(.top, 10.0)
               
                Image("saatnya")
                    .resizable()
                    .frame(width: 400.0, height: 20.0)
                    .padding(.vertical, 10.0)
                
                ZStack{
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200.0, height: 240.0)
                    if(prompt != "plus1" && prompt != "plus2" && prompt != "plus3" && prompt != "plus4" && prompt != "changeColor"){
                        Text(prompt)
                            .font(.system(size: 10, weight: .semibold))
                            .foregroundColor(Color("Brown"))
                            .multilineTextAlignment(.leading)
                            .frame(width: 100)
                            .padding(.top, 160)
                            .padding(.leading, -20.0)
                    }
                    
                     
                }.rotationEffect(.degrees(-5))
                    .shadow(radius: 4,x: 0, y:2)
                
                var tempPlayers:Int = (vm.extractInteger(from: tempPlayer) ?? 1)
                var nextPlayer:String = "Player \(tempPlayers + 1)"
                NavigationLink(destination: giliranView(vm: vm), isActive: $showOfflineGameView){
                    Button(action: {
                        playMusic(music: "ButtonSound", loop: 0, volume: 0.5)
                        if(tempPlayers == playerTotal)
                        {
                            UserDefaults.standard.set("Player 1", forKey: "tempPlayer")
                        }
                        else{
                            UserDefaults.standard.set(nextPlayer, forKey: "tempPlayer")
                        }
                        
                        showOfflineGameView = true
                    }) {
                        HStack{
                            Image(systemName: "play.fill")
                                .foregroundColor(Color("DarkBlue"))
                                .padding(.top, -5.0)
                            Text("SELESAI")
                                .fontWeight(.heavy)
                                .foregroundColor(Color("DarkBlue"))
                                .padding(.top, -7.0)
                        } .background(Image("Button"))
                            .padding(.leading, 550.0)
                    }
                }
                
            }.background(Image("BGglow"))
        }.navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
        .onAppear{
            
            print("INI TEMP CARD PROMPT: \(prompt)")
            
            if showOfflineGameView{
                showOfflineGameView = false
            }
        }
    }
}


