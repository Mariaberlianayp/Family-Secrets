//
//  CardGenerator.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 27/04/23.
//

import Foundation

final class CardGenerator {
    
    static let TruthCards = [
        // filename, prompt, nextType
        ["TruthCard1", "Truth", ["ask", "dare", "special"]] as [Any],
        ["TruthCard2", "Truth", ["truth", "dare", "special"]],
        ["TruthCard3", "Truth", ["truth", "ask", "special"]],
        ["TruthCard4", "Truth", ["ask", "dare", "special"]],
        ["TruthCard5", "Truth", ["truth", "dare", "special"]],
        ["TruthCard6", "Truth", ["truth", "ask", "special"]],
        ["TruthCard7", "Truth", ["ask", "dare", "special"]],
        ["TruthCard8", "Truth", ["truth", "dare", "special"]],
        ["TruthCard9", "Truth", ["truth", "ask", "special"]],
        ["TruthCard10", "Truth", ["ask", "dare", "special"]],
        ["TruthCard11", "Truth", ["truth", "dare", "special"]],
        ["TruthCard12", "Truth", ["truth", "ask", "special"]],
        ["TruthCard13", "Truth", ["ask", "dare", "special"]],
        ["TruthCard14", "Truth", ["truth", "dare", "special"]],
        ["TruthCard15", "Truth", ["truth", "dare", "special"]],
        ["TruthCard16", "Truth", ["truth", "dare", "special"]],
        ["TruthCard17", "Truth", ["truth", "ask", "special"]],
        ["TruthCard18", "Truth", ["truth", "ask", "special"]],
        ["TruthCard19", "Truth", ["truth", "ask", "special"]],
        ["TruthCard20", "Truth", ["truth", "ask", "special"]],
        ["TruthCard21", "Truth", ["truth", "ask", "special"]],
        ["TruthCard22", "Truth", ["truth", "dare", "special"]],
        ["TruthCard23", "Truth", ["truth", "ask", "special"]],
        ["TruthCard24", "Truth", ["truth", "ask", "special"]]
    ]
    
    static let DareCards = [
        // filename, prompt, gamemode, nextType
        ["DareCard1", "Dare", "Online", ["dare", "truth", "special"]] as [Any],
        ["DareCard2", "Dare", "Offline", ["dare", "ask", "special"]],
        ["DareCard3", "Dare", "Offline", ["ask", "truth", "special"]],
        ["DareCard4", "Dare", "Offline", ["dare", "truth", "special"]],
        ["DareCard5", "Dare", "Offline", ["dare", "truth", "special"]],
        ["DareCard6", "Dare", "Offline", ["dare", "ask", "special"]],
        ["DareCard7", "Dare", "Offline", ["dare", "ask", "special"]],
        ["DareCard8", "Dare", "Offline", ["ask", "truth", "special"]],
        ["DareCard9", "Dare", "Offline", ["ask", "truth", "special"]],
        ["DareCard10", "Dare", "Offline", ["dare", "ask", "special"]],
        ["DareCard11", "Dare", "Offline", ["dare", "ask", "special"]],
        ["DareCard12", "Dare", "Offline", ["ask", "truth", "special"]],
        ["DareCard13", "Dare", "Offline", ["dare", "truth", "special"]],
        ["DareCard14", "Dare", "Offline", ["dare", "ask", "special"]],
        ["DareCard15", "Dare", "Offline", ["ask", "truth", "special"]],
        ["DareCard16", "Dare", "Offline", ["dare", "ask", "special"]],
        ["DareCard17", "Dare", "Offline", ["ask", "truth", "special"]],
        ["DareCard18", "Dare", "Offline", ["ask", "truth", "special"]],
        ["DareCard19", "Dare", "Offline", ["dare", "ask", "special"]],
        ["DareCard20", "Dare", "Offline", ["dare", "ask", "special"]],
        ["DareCard21", "Dare", "Offline", ["ask", "truth", "special"]],
        ["DareCard22", "Dare", "Offline", ["dare", "truth", "special"]],
        ["DareCard23", "Dare", "Offline", ["dare", "ask", "special"]],
        ["DareCard24", "Dare", "Offline", ["dare", "truth", "special"]],
        ["DareCard25", "Dare", "Offline", ["dare", "ask", "special"]],
        ["DareCard26", "Dare", "Offline", ["ask", "truth", "special"]],
        ["DareCard27", "Dare", "Offline", ["dare", "truth", "special"]],
        ["DareCard28", "Dare", "Offline", ["dare", "ask", "special"]],
        ["DareCard29", "Dare", "Offline", ["ask", "truth", "special"]],
        ["DareCard30", "Dare", "Offline", ["dare", "ask", "special"]],
        ["DareCard31", "Dare", "Offline", ["ask", "truth", "special"]],
        ["DareCard32", "Dare", "Offline", ["dare", "truth", "special"]],
        ["DareCard33", "Dare", "Offline", ["dare", "ask", "special"]],
        ["DareCard34", "Dare", "Offline", ["dare", "ask", "special"]],
        ["DareCard35", "Dare", "Offline", ["dare", "truth", "special"]],
        ["DareCard36", "Dare", "Offline", ["dare", "truth", "special"]],
        ["DareCard37", "Dare", "Offline", ["ask", "truth", "special"]],
        ["DareCard38", "Dare", "Offline", ["dare", "truth", "special"]]
    ]
    
    static let AskCards = [
        // filename, prompt, nextType
        ["AskCard1", "Ask", ["truth", "dare", "special"]] as [Any],
        ["AskCard2", "Ask", ["truth", "ask", "special"]],
        ["AskCard3", "Ask", ["ask", "dare", "special"]],
        ["AskCard4", "Ask", ["truth", "dare", "special"]],
        ["AskCard5", "Ask", ["truth", "ask", "special"]],
        ["AskCard6", "Ask", ["ask", "dare", "special"]],
        ["AskCard7", "Ask", ["truth", "dare", "special"]],
        ["AskCard8", "Ask", ["truth", "ask", "special"]],
        ["AskCard9", "Ask", ["ask", "dare", "special"]],
        ["AskCard10", "Ask", ["truth", "dare", "special"]],
        ["AskCard11", "Ask", ["truth", "ask", "special"]],
        ["AskCard12", "Ask", ["ask", "dare", "special"]],
        ["AskCard13", "Ask", ["truth", "dare", "special"]],
        ["AskCard14", "Ask", ["truth", "ask", "special"]],
        ["AskCard15", "Ask", ["ask", "dare", "special"]],
        ["AskCard16", "Ask", ["truth", "dare", "special"]],
        ["AskCard17", "Ask", ["truth", "ask", "special"]],
        ["AskCard18", "Ask", ["ask", "dare", "special"]]
    ]
    
    static let SpecialCards = [
        // filename, prompt
        ["SpecialFreeCard", "free"],
        ["SpecialFreeCard", "free"],
        ["SpecialFreeCard", "free"],
        ["SpecialFreeCard", "free"],
        ["Special1Card", "1"],
        ["Special1Card", "1"],
        ["Special1Card", "1"],
        ["Special1Card", "1"],
        ["Special2Card", "2"],
        ["Special2Card", "2"],
        ["Special2Card", "2"],
        ["Special2Card", "2"],
        ["Special3Card", "3"],
        ["Special3Card", "3"],
        ["Special3Card", "3"],
        ["Special3Card", "3"],
        ["Special4Card", "4"],
        ["Special3Card", "4"],
        ["Special3Card", "4"],
        ["Special3Card", "4"],
    ]
    
    static func InitializeGameDeck() -> Array<GameCard> {
        var id = 0
        var deck: Array<GameCard> = []
        
        for card in TruthCards {
            deck.append(GameCard(id: id, type: "truth", filename: card[0] as! String, gameMode: "Online", prompt: card[1] as! String, isInPlayerDeck: false, nextType: card[2] as! Array<String>) )
            id += 1
        }
        
        for card in DareCards {
            deck.append(GameCard(id: id, type: "dare", filename: card[0] as! String, gameMode: card[2] as! String, prompt: card[1] as! String, isInPlayerDeck: false, nextType: card[3] as! Array<String>))
            id += 1
        }
        
        for card in AskCards {
            deck.append(GameCard(id: id, type: "ask", filename: card[0] as! String, gameMode: "Online", prompt: card[1] as! String, isInPlayerDeck: false, nextType: card[2] as! Array<String>))
            id += 1
        }
        
        for card in SpecialCards {
            deck.append(GameCard(id: id, type: "special", filename: card[0], gameMode: "Online", prompt: card[1], isInPlayerDeck: false, nextType: ["truth", "dare", "ask", "special"]))
            id += 1
        }
        
        return deck.shuffled()
    }
    
    static func GetRandomCardOfCertainType(type: String, gameDeck: Array<GameCard>) -> GameCard {
        let randomTruthCard = gameDeck.first {
            $0.type == type && $0.isInPlayerDeck == false
        }
        randomTruthCard!.isInPlayerDeck = true
        return randomTruthCard!
    }
    
    static func GetRandomCard(gameDeck: Array<GameCard>) -> GameCard {
        let randomCard = gameDeck.first {
            $0.isInPlayerDeck == false
        }
        randomCard!.isInPlayerDeck = true
        return randomCard!
    }
}
