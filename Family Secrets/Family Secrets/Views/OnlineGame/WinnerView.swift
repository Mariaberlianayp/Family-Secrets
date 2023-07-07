//
//  WinnerView.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 01/05/23.
//

import SwiftUI

struct WinnerView: View {
    
    let player: Player
    @State var navigateToGameMenu: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack{
                Image("Win_Page")
                    .resizable()
                
                Image(player.avatar)
                    .resizable()
                    .frame(width: 123, height: 123)
                
                ZStack{
                    Image("banner").resizable().frame(width: 231, height: 50)
                    
                    Text("\(player.username)").foregroundColor(.black)
                        .font(.system(size: 22, weight: .heavy, design: .rounded))
                        .offset(x:0, y: -5)
                }
                .offset(x:0, y: 60)
                
                Button{
                    navigateToGameMenu = true
                }label: {
                    ZStack {
                        Rectangle()
                            .background(.black)
                            .frame(width: 156, height: 43)
                            .cornerRadius(100)
                            .opacity(0.2)
                        
                        HStack {
                            Text("MAIN MENU")
                                .font(.system(size: 18, weight: .heavy, design: .rounded))
                        }
                        .foregroundColor(.white)
                    }
                    .foregroundColor(.black)
                }
                .offset(x:330, y: 160)
            }.onAppear(){
                stopMusic()
                playMusic(music: "DoneSound", loop: 0, volume: 0.7)
            }
            .ignoresSafeArea()
            .navigationDestination(isPresented: $navigateToGameMenu) {
                GameMenuView()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct WinnerView_Previews: PreviewProvider {
    static var previews: some View {
        WinnerView(player: Player(id: "1", avatar: "game_avatar_1", username: "albert")).previewInterfaceOrientation(.landscapeRight)
    }
}
