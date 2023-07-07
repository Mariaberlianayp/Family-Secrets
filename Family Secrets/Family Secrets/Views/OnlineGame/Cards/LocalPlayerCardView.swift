//
//  LocalPlayerCardView.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 04/05/23.
//

import SwiftUI

struct LocalPlayerCardView: View {
    
    let width: Double
    let height: Double
    @State var cardNo: Int
    @State var card: GameCard
    @ObservedObject var gameViewModel: OnlineGameViewModel
    @Binding var deckOpacity: Double
    @Binding var overlayOpacity: Double
    @State var offset = CGSizeZero
    
    var body: some View {
        Image("\(card.filename)")
            .resizable()
            .frame(width: width, height: height)
            .offset(offset)
            .onTapGesture {
                playMusic(music: "CardSound", loop: 0, volume: 0.5)
                if gameViewModel.CardChosenisValidAnswer(index: cardNo) {
                    updatePlayedCardData()
                    gameViewModel.RefreshDeck()
                    if gameViewModel.players[0].cardDeck.count == 0 {
                        gameViewModel.winnerIsDetermined = true
                        gameViewModel.winnerId = gameViewModel.players[0].id
                        gameViewModel.sendData(data: gameViewModel.GetStringData(label: "winner", message: gameViewModel.players[0].id), mode: .reliable)
                    }
                }
            }
            .onChange(of: gameViewModel.challengeIsDone) { _ in
                if gameViewModel.challengeIsDone {
                    updateNextPlayer()
                    gameViewModel.challengeIsDone = false
                }
            }
    }
    
    func showChallengeView() {
        deckOpacity = 0
        overlayOpacity = 0
        gameViewModel.activeCardFilename = card.filename
        gameViewModel.challengeOpacity = 1
        gameViewModel.sendData(data: gameViewModel.GetStringData(label: "challengeStart", message: card.filename), mode: .reliable)
    }
    
    func updateNextPlayer() {
        if !gameViewModel.winnerIsFound() {
            gameViewModel.UpdateCurrentPlayer()
        }
    }
    
    func updatePlayedCardData() {
        let card = gameViewModel.players[0].cardDeck[cardNo]
        
        gameViewModel.AddToPlayedDeck(index: cardNo)
        gameViewModel.sendData(data: gameViewModel.GetInitialPlayedCardData(), mode: .reliable)
        gameViewModel.sendData(
            data: gameViewModel.GetPlayerPlayedCardData(id: gameViewModel.players[0].id, index: cardNo),
            mode: .reliable)
        
        if card.prompt != "free" {
            if card.type == "special" {
                if gameViewModel.players[0].id == gameViewModel.ownerId {
                    var nextPlayer = gameViewModel.players[1]
                    
                    for _ in 0 ..< Int(card.prompt)! {
                        gameViewModel.gameDeck.last?.isInPlayerDeck = true
                        
                        let card = gameViewModel.gameDeck.popLast()
                        nextPlayer.cardDeck.append(card!)
                        gameViewModel.sendData(data: gameViewModel.GetPlayerDeckData(id: nextPlayer.id, card: card!), mode: .reliable)
                        gameViewModel.sendData(data: gameViewModel.GetStringData(label: "popGameDeck", message: ""), mode: .reliable)
                        gameViewModel.ReshuffleCard()
                    }
                } else {
                    gameViewModel.sendData(data: gameViewModel.GetStringData(label: "specialToOwner", message: card.prompt), mode: .reliable)
                }
                deckOpacity = 0
                overlayOpacity = 0
                gameViewModel.challengeIsDone = true
                gameViewModel.RefreshDeck()
                return
            } else {
                showChallengeView()
                return
            }
            deckOpacity = 0
            overlayOpacity = 0
        }
    }
}
