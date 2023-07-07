//
//  GameDeckView.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 27/04/23.
//

import SwiftUI

struct GameStackView: View {
    
    @ObservedObject var gameViewModel: OnlineGameViewModel
    
    let type: String
    
    var body: some View {
        ZStack {
            if type == "AvailableCard" {
                ForEach(gameViewModel.gameDeck.indices, id: \.self) { i in
                    GameCardView(positionX: CGFloat(200 + i / 10), positionY: CGFloat(100 - i / 10), gameViewModel: gameViewModel)
                }
            } else {
                ForEach(gameViewModel.playedDeck.indices, id: \.self) { i in
                    PlayedCardView(gameViewModel: gameViewModel, index: i)
                }
            }
        }
    }
    
}
