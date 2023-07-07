//
//  GameCardStackView.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 27/04/23.
//

import SwiftUI

struct GameCardView: View {
    
    let width: Double = 80
    let height: Double = 120
    @State var positionX: CGFloat
    @State var positionY: CGFloat
    @State var initPositionX: CGFloat = 0
    @State var initPositionY: CGFloat = 0
    @ObservedObject var gameViewModel: OnlineGameViewModel
    
    var body: some View {
        Image("CardBack")
            .resizable()
            .frame(width: width, height: height)
            .rotationEffect(.degrees(160))
            .position(x: positionX, y: positionY)
            .onTapGesture {
                if gameViewModel.players[0].id == gameViewModel.currentPlayer {
                    playMusic(music: "CardSound", loop: 0, volume: 0.5)
                    getNewCardFromGameDeck()
                }
            }
            .shadow(radius: 1)
    }
    
    func getNewCardFromGameDeck() {
        gameViewModel.players[0].cardDeck.append(gameViewModel.gameDeck.last!)
        gameViewModel.gameDeck.last!.isInPlayerDeck = true
        
        gameViewModel.sendData(data: gameViewModel.GetGameDeckData(index: gameViewModel.gameDeck.count - 1, label: "popLastGameDeck"), mode: .reliable)
        
        gameViewModel.PopLastGameDeck()
        
        // reshuffle card klo uda abis
        gameViewModel.ReshuffleCard()
        
        if !gameViewModel.winnerIsFound() {
            gameViewModel.UpdateCurrentPlayer()
        }
    }
}
