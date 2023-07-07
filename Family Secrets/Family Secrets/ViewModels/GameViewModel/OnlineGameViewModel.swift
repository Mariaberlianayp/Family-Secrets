//
//  GameCenterHelper.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 24/04/23.
//

import Foundation
import GameKit

class OnlineGameViewModel: NSObject, GKLocalPlayerListener, ObservableObject {
    
    @Published var players: Array<Player> = []
    @Published var matchFound = false
    @Published var playedDeck: Array<GameCard> = []
    @Published var gameDeck: Array<GameCard> = []
    @Published var currentPlayer: String = ""
    @Published var ownerId: String = ""
    @Published var winnerIsDetermined: Bool = false
    @Published var activeCardFilename: String = ""
    @Published var challengeOpacity: Double = 0
    @Published var challengeIsDone: Bool = false
    @Published var navigateToTutorialView: Bool = false
    var winnerId: String = ""
    var playerCount: Int = 0
    var match: GKMatch?

    func GetCurrentPlayerUsername() -> String {
        for player in players {
            if player.id == currentPlayer {
                return player.username
            }
        }
        return ""
    }
    
    func InitGameRoom() {
       ownerId = players[0].id
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) { [self] in
            for player in players {
                if player.id < ownerId {
                    ownerId = player.id
                }
            }
            
            if players[0].id == ownerId {
                InitGameData()
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) { [self] in
                    self.SendGameData()
                }
            }
        }
    }
    
    func SendGameData() {
        for index in 0 ..< gameDeck.count {
            sendData(data: GetGameDeckData(index: index, label: "newGameDeckCard"), mode: .reliable)
        }
        
        sendData(data: GetInitialPlayedCardData(), mode: .reliable)
        
        sendData(data: GetStringData(label: "currentPlayer", message: currentPlayer), mode: .reliable)
        
        for player in players {
            for card in player.cardDeck {
                sendData(data: GetPlayerDeckData(id: player.id, card: card), mode: .reliable)
            }
        }
    }
    
    func InitGameData() {
        gameDeck = CardGenerator.InitializeGameDeck()
        playedDeck.append(CardGenerator.GetRandomCard(gameDeck: gameDeck))
        currentPlayer = players[0].id
        
        for player in players {
            player.initializeDeck(gameDeck: gameDeck)
        }
    }
    
    func AddToPlayedDeck(index: Int) {
        players[0].cardDeck[index].rotation = Double.random(in: 0.0 ..< 360.0)
        playedDeck.append(players[0].cardDeck[index])
        players[0].cardDeck[index].isInPlayerDeck = false
        players[0].cardDeck.remove(at: index)
    }
    
    func RefreshDeck() {
        objectWillChange.send()
    }
    
    func StartGame(newMatch: GKMatch) {
        match = newMatch
        match?.delegate = self
        sendData(data: GetPlayerProfileData(), mode: .reliable)
    }
    
    func UpdateGameDeck(card: GameCard) {
        gameDeck.append(card)
    }
    
    func UpdatePlayedDeck(newDeck: Array<GameCard>) {
        playedDeck = newDeck
    }
    
    func AppendPlayedDeck(playedCard: GameCard) {
        playedDeck.append(playedCard)
    }
    
    func AppendPlayers(playerId: String, avatar: String, username: String) {
        players.append(Player(id: playerId, avatar: avatar, username: username))
    }
    
    func UpdateCurrentPlayer() {
        if players[0].id == ownerId {
            for (index, player) in players.enumerated() {
                if player.id == currentPlayer {
                    if index >= playerCount - 1 {
                        currentPlayer = players[0].id
                    } else {
                        currentPlayer = players[index + 1].id
                    }
                    break
                }
            }
            sendData(data: GetStringData(label: "currentPlayer", message: currentPlayer), mode: .reliable)
        } else {
            sendData(data: GetStringData(label: "nextPlayer", message: currentPlayer), mode: .reliable)
        }
    }
    
    func ReshuffleCard() {
        if gameDeck.isEmpty {
            for card in playedDeck {
                if card != playedDeck.last{
                    card.isInPlayerDeck = false
                    gameDeck.append(card)
                }
            }
            
            gameDeck.shuffle()
            RefreshDeck()
            
            for index in 0 ..< gameDeck.count {
                sendData(data: GetGameDeckData(index: index, label: "newGameDeckCard"), mode: .reliable)
            }
        }
    }
    
    func PopLastGameDeck() {
        gameDeck.removeLast()
    }
    
    func GetWinner() -> Player {
        for player in players {
            if winnerId == player.id {
                return player
            }
        }
        return players[0]
    }
}
