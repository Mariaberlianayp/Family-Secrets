//
//  PlayerDeckView.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 27/04/23.
//

import SwiftUI

struct PlayerDeckView: View {
    
    @State var basePositionX: CGFloat
    @State var basePositionY: CGFloat
    @ObservedObject var gameViewModel: OnlineGameViewModel
    @State var deckOpacity: Double = 0
    @State var overlayOpacity: Double = 0
    
    let playerNo: Int
    
    var body: some View {
        ZStack{
            ZStack {
                ForEach(gameViewModel.players[playerNo].cardDeck.indices, id: \.self) { i in
                        if playerNo == 0 {
                            PlayerCardView(positionX: getPositionX(cardNo: i), positionY: basePositionY, filename: $gameViewModel.players[0].cardDeck[i].filename)
                        } else {
                            OtherPlayerCardView(card: gameViewModel.players[playerNo].cardDeck[i], positionX: getPositionX(cardNo: i), positionY: basePositionY)
                        }
                }
            }
            .onTapGesture {
                if gameViewModel.players[0].id == gameViewModel.currentPlayer {
                    playMusic(music: "PlusCardSound", loop: 0, volume: 0.5)
                    deckOpacity = 1
                    overlayOpacity = 0.5
                }
            }

            if gameViewModel.players[0].id == gameViewModel.currentPlayer {
                PlayerDeckScrollView(gameViewModel: gameViewModel, deckOpacity: $deckOpacity, overlayOpacity: $overlayOpacity)
                    .opacity(deckOpacity)
                    .zIndex(1000)
            }
        }
    }
    
    func getPositionX(cardNo: Int) -> CGFloat {
        return 30 * CGFloat(cardNo) + basePositionX
    }
}
