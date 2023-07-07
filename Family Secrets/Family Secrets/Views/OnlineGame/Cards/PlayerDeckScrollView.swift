//
//  PlayerDeckScrollView.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 04/05/23.
//

import SwiftUI

struct PlayerDeckScrollView: View {
    
    @ObservedObject var gameViewModel: OnlineGameViewModel
    @Binding var deckOpacity: Double
    @Binding var overlayOpacity: Double
    
    var body: some View {
        ZStack {
            Rectangle()
                .background(.gray)
                .opacity(overlayOpacity)
                .frame(width: .infinity, height: .infinity)
                .onTapGesture {
                    playMusic(music: "ButtonSound", loop: 0, volume: 0.5)
                    deckOpacity = 0
                    overlayOpacity = 0
                }
            
            VStack {
                OutlineTextView(text: "PILIH KARTU YANG INGIN KAMU MAINKAN", fontSize: 22)
                    .padding(.bottom, 10)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(gameViewModel.players[0].cardDeck.indices, id: \.self) { i in
                            if gameViewModel.players[0].cardDeck[i].isInPlayerDeck {
                                LocalPlayerCardView(width: 161, height: 240, cardNo: i, card: gameViewModel.players[0].cardDeck[i], gameViewModel: gameViewModel, deckOpacity: $deckOpacity, overlayOpacity: $overlayOpacity)
                            }
                        }
                    }
                }
                
                Button {
                    playMusic(music: "ButtonSound", loop: 0, volume: 0.5)
                    deckOpacity = 0
                    overlayOpacity = 0
                } label: {
                    BackButtonView()
                }
                .padding(.top, 10)
                .offset(CGSize(width: 340, height: 0))
            }
            .frame(width: .infinity, height: 300)
        }
    }
}
