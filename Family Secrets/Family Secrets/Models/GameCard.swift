//
//  Card.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 27/04/23.
//

import Foundation

class GameCard: NSObject, NSSecureCoding {

    var id: Int
    var type: String
    var filename: String
    var gameMode: String
    var prompt: String
    var isInPlayerDeck: Bool = false
    var nextType: Array<String>
    var rotation: Double = 0
    
    init(id: Int, type: String, filename: String, gameMode: String, prompt: String, isInPlayerDeck: Bool, nextType: Array<String>) {
        self.id = id
        self.type = type
        self.filename = filename
        self.gameMode = gameMode
        self.prompt = prompt
        self.isInPlayerDeck = isInPlayerDeck
        self.nextType = nextType
    }
    
    static var supportsSecureCoding: Bool {
        return true
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(id, forKey: "id")
        coder.encode(type, forKey: "type")
        coder.encode(filename, forKey: "filename")
        coder.encode(gameMode, forKey: "gameMode")
        coder.encode(prompt, forKey: "prompt")
        coder.encode(isInPlayerDeck, forKey: "isInPlayerDeck")
        coder.encode(nextType, forKey: "nextType")
        coder.encode(rotation, forKey: "rotation")
    }
    
    required init(coder: NSCoder) {
        self.id = coder.decodeInteger(forKey: "id")
        self.type = coder.decodeObject(forKey: "type") as! String
        self.filename = coder.decodeObject(forKey: "filename") as! String
        self.gameMode = coder.decodeObject(forKey: "gameMode") as! String
        self.prompt = coder.decodeObject(forKey: "prompt") as! String
        self.isInPlayerDeck = coder.decodeBool(forKey: "isInPlayerDeck")
        self.nextType = coder.decodeArrayOfObjects(ofClass: NSString.self, forKey: "nextType")! as [String]
        self.rotation = coder.decodeDouble(forKey: "rotation")
    }
    
}
