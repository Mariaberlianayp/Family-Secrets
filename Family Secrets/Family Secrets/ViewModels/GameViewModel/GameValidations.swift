//
//  GameValidations.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 29/04/23.
//

import Foundation

extension OnlineGameViewModel {
    func winnerIsFound() -> Bool {
        for player in players {
            print("\(player.username) : jumlah kartu \(player.cardDeck.count)")
        }
        
        print("\(players[0].username) : jumlah \(players[0].cardDeck.count) ")
        
        if players[0].cardDeck.isEmpty {
            print("udah abis")
            winnerIsDetermined = true
            winnerId = players[0].id
            sendData(data: GetStringData(label: "winner", message: players[0].id), mode: .reliable)
            return true
        }
        return false
    }
    
    func IsAllowedToTakeCard() -> Bool {
        if currentPlayer == players[0].id {
            return true
        }
        return false
    }
    
    func CardChosenisValidAnswer(index: Int) -> Bool {
        let topmost = playedDeck.last
        let card = players[0].cardDeck[index]
        
        for type in topmost!.nextType {
            if type == card.type {
                return true
            }
        }
        return false
    }
    
    func CheckGameDeck() {
        if gameDeck.isEmpty {
            for card in playedDeck {
                // kalo error nnti coba truncate aja smua except last card
                if card.isInPlayerDeck == false && card.id != playedDeck.last!.id {
                    gameDeck.append(card)
                    playedDeck.removeFirst()
                }
            }
            gameDeck.shuffle()
        }
    }
}
