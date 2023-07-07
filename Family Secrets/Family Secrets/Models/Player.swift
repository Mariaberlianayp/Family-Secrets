//
//  Player.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 27/04/23.
//

import Foundation

class Player {
    
    var id: String
    var cardDeck: Array<GameCard> = []
    var avatar: String = ""
    var username: String = ""
    
    init(id: String, avatar: String, username: String) {
        self.id = id
        self.avatar = avatar
        self.username = username
    }
    
    func initializeDeck(gameDeck: Array<GameCard>) {
        for _ in 0 ..< 5 {
            cardDeck.append(CardGenerator.GetRandomCard(gameDeck: gameDeck))
        }
    }
    
    func removeCard(index: Int) {
        cardDeck.remove(at: index)
    }
}
