//
//  DataExchange.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 29/04/23.
//

import Foundation
import GameKit

extension OnlineGameViewModel: GKMatchDelegate {
    
    func match(_ match: GKMatch, player: GKPlayer, didChange state: GKPlayerConnectionState) {
        print("ADA YG DISCONNECT")
    }
    
    func match(_ match: GKMatch, didFailWithError error: Error?) {
        print("MATCH INVALID")
    }
    
    func match(_ match: GKMatch, didReceive data: Data, fromRemotePlayer player: GKPlayer) {
        DecodeReceivedData(data: data)
    }
    
    func GetCardData(label: String, card: GameCard) -> Data {
        let archiver = NSKeyedArchiver(requiringSecureCoding: false)
        archiver.encode(label, forKey: "label")
        archiver.encode(card, forKey: "data")
        return archiver.encodedData
    }
    
    func GetStringData(label: String, message: String) -> Data {
        let archiver = NSKeyedArchiver(requiringSecureCoding: false)
        archiver.encode(label, forKey: "label")
        archiver.encode(message, forKey: "data")
        return archiver.encodedData
    }
    
    func GetGameDeckData(index: Int, label: String) -> Data {
        let archiver = NSKeyedArchiver(requiringSecureCoding: true)
        archiver.encode(label, forKey: "label")
        archiver.encode(gameDeck[index], forKey: "data")
        archiver.finishEncoding()
        return archiver.encodedData
    }
    
    func GetInitialPlayedCardData() -> Data {
        let archiver = NSKeyedArchiver(requiringSecureCoding: true)
        archiver.encode("initialPlayedCard", forKey: "label")
        archiver.encode(playedDeck.last, forKey: "data")
        return archiver.encodedData
    }
    
    func GetPlayedCardIndexFromPlayerDeck(index: Int) -> Data {
        let archiver = NSKeyedArchiver(requiringSecureCoding: true)
        archiver.encode("playedCard", forKey: "label")
        archiver.encode(index, forKey: "data")
        return archiver.encodedData
    }
    
    func GetPlayerDeckData(id: String, card: GameCard) -> Data {
        let archiver = NSKeyedArchiver(requiringSecureCoding: true)
        archiver.encode("playerDeck", forKey: "label")
        archiver.encode(id, forKey: "id")
        archiver.encode(card, forKey: "data")
        return archiver.encodedData
    }
    
    func GetPlayerPlayedCardData(id: String, index: Int) -> Data {
        let archiver = NSKeyedArchiver(requiringSecureCoding: true)
        archiver.encode("popPlayerDeck", forKey: "label")
        archiver.encode(id, forKey: "id")
        archiver.encode(index, forKey: "data")
        return archiver.encodedData
    }
    
    func GetPlayerProfileData() -> Data {
        let archiver = NSKeyedArchiver(requiringSecureCoding: true)
        archiver.encode("profile", forKey: "label")
        archiver.encode(players[0].id, forKey: "id")
        archiver.encode(players[0].username, forKey: "username")
        archiver.encode(players[0].avatar, forKey: "avatar")
        return archiver.encodedData
    }
    
    func sendData(data: Data, mode: GKMatch.SendDataMode) {
        do {
            try match?.sendData(toAllPlayers: data, with: mode)
        } catch {
            print(error)
        }
    }
    
    func DecodeReceivedData(data: Data) {
        let unarchiver = try! NSKeyedUnarchiver(forReadingFrom: data)
        let label = unarchiver.decodeObject(forKey: "label") as! String
        
        switch label {
            
        case "challengeStart":
            let data = unarchiver.decodeInteger(forKey: "data")
            activeCardFilename = playedDeck.last!.filename
            challengeOpacity = 1
            
        case "challengeEnd":
            challengeOpacity = 0
            
        case "playedCard":
            let data = unarchiver.decodeInteger(forKey: "data")
            let id = unarchiver.decodeObject(forKey: "id") as! String
            
            for player in players {
                if player.id == id {
                    player.cardDeck.remove(at: data)
                    RefreshDeck()
                }
            }
            UpdateCurrentPlayer()
            
        case "initialPlayedCard":
            let data = unarchiver.decodeObject(of: GameCard.self, forKey: "data")!
            AppendPlayedDeck(playedCard: data)
            
        case "newGameDeckCard":
            let data = unarchiver.decodeObject(of: GameCard.self, forKey: "data")!
            UpdateGameDeck(card: data)
            
        case "popLastGameDeck":
            let data = unarchiver.decodeObject(of: GameCard.self, forKey: "data")
            PopLastGameDeck()
            
            for player in players {
                if player.id == currentPlayer {
                    data?.isInPlayerDeck = true
                    player.cardDeck.append(data!)
                    RefreshDeck()
                    break
                }
            }
            
        case "playerDeck":
            let data = unarchiver.decodeObject(of: GameCard.self, forKey: "data")!
            let id = unarchiver.decodeObject(forKey: "id") as! String
            
            for player in players {
                if player.id == id {
                    player.cardDeck.append(data)
                }
            }
            
        case "popPlayerDeck":
            let data = unarchiver.decodeInteger(forKey: "data")
            let id = unarchiver.decodeObject(forKey: "id") as! String
            
            for player in players {
                if player.id == id {
                    player.cardDeck.remove(at: data)
                }
            }
            
        case "winner":
            let data = unarchiver.decodeObject(forKey: "data") as! String
            winnerId = data
            winnerIsDetermined = true
            
        case "profile":
            let id = unarchiver.decodeObject(forKey: "id") as! String
            let username = unarchiver.decodeObject(forKey: "username") as! String
            let avatar = unarchiver.decodeObject(forKey: "avatar") as! String
            
            AppendPlayers(playerId: id, avatar: avatar, username: username)
            
            if players.count == playerCount {
                InitGameRoom()
            }
            
        case "popGameDeck":
            gameDeck.popLast()
            ReshuffleCard()
            
        case "specialToOwner":
            print("MASUK")
            let data = unarchiver.decodeObject(forKey: "data") as! String
            var currentPlayerFound = false
            var nextPlayer = players[0]
            
            if players[0].id == ownerId {
                for player in players {
                    if currentPlayerFound {
                        nextPlayer = player
                        break
                    }
                    
                    if player.id == currentPlayer {
                        currentPlayerFound = true
                    }
                }
                
                print("JUMLAH KARTU \(data)")
                for _ in 0 ..< Int(data)! {
                    print("NAMBAH KARTU")
                    gameDeck.last?.isInPlayerDeck = true
                    let card = gameDeck.popLast()
                    nextPlayer.cardDeck.append(card!)
                    sendData(data: GetPlayerDeckData(id: nextPlayer.id, card: card!), mode: .reliable)
                    sendData(data: GetStringData(label: "popGameDeck", message: ""), mode: .reliable)
                    ReshuffleCard()
                }
            }
            
        default:
            let data = unarchiver.decodeObject(forKey: "data") as! String

            if label == "currentPlayer" {
                currentPlayer = data
            } else {
                if ownerId == players[0].id {
                    UpdateCurrentPlayer()
                }
            }
        }
        unarchiver.finishDecoding()
    }
}
