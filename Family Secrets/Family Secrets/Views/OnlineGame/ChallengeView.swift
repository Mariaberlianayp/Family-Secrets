//
//  ChallengeView.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 05/05/23.
//

import SwiftUI

struct ChallengeView: View {
    
    @ObservedObject var gameViewModel: OnlineGameViewModel
    
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
            
            VStack {
                ZStack {
                    Image("Challenge_Player_Text")
                        .resizable()
                        .frame(width: 173, height: 37)
                    
                    Text(gameViewModel.GetCurrentPlayerUsername())
                        .font(.system(size: 16, weight: .heavy, design: .rounded))
                        .offset(CGSize(width: 0, height: -3))
                }
                
                Image("Challenge_Text")
                    .resizable()
                    .frame(width: 550, height: 30)
                
                ZStack {
                    Circle()
                        .zIndex(-100)
                        .frame(width: 120, height: 120)
                        .shadow(color: .white, radius: 100)
                    Image("\(gameViewModel.activeCardFilename)")
                        .resizable()
                        .frame(width: 144, height: 223)
                        .rotationEffect(.degrees(-5))
                }
            }
            
            if gameViewModel.currentPlayer == gameViewModel.players[0].id {
                Button {
                    gameViewModel.challengeIsDone = true
                    gameViewModel.challengeOpacity = 0
                    gameViewModel.sendData(data: gameViewModel.GetStringData(label: "challengeEnd", message: ""), mode: .reliable)
                } label: {
                    ButtonView(width: 130, height: 40, text: "SELESAI", fontSize: 20)
                }
                .position(x: 750, y: 350)
            }
        }
        .ignoresSafeArea()
    }
}

//struct ChallengeView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChallengeView()
//            .previewInterfaceOrientation(.landscapeRight)
//    }
//}
