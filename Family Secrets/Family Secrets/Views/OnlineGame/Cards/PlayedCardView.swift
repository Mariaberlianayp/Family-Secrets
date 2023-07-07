//
//  PlayedCardView.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 27/04/23.
//

import SwiftUI

struct PlayedCardView: View {
    
    let width: Double = 80
    let height: Double = 120
    @ObservedObject var gameViewModel: OnlineGameViewModel
    @State var index: Int
    @State var flag = false
    
    var body: some View {
        ZStack {
            Image("\(gameViewModel.playedDeck[index].filename)")
                .resizable()
                .frame(width: width, height: height)
                .rotationEffect(.degrees(gameViewModel.playedDeck[index].rotation))
                .shadow(color: .black, radius: 2)
        }
    }
    
    func addToCardStack(newCard: GameCard) {
        gameViewModel.playedDeck.append(newCard)
    }
}
