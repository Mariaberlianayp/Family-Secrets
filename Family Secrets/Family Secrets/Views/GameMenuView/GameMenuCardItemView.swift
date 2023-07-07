//
//  CardSelectionView.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 25/04/23.
//

import SwiftUI

struct GameMenuCardItemView: View {
    
    let gameMode: String
    @Binding var selectedMode: String
    @Binding var navigateToPlayerMenuView: Bool
    @Binding var navigateToOfflineGameView: Bool
    @StateObject var viewModel = GameMenuCardItemViewModel()
    
    var body: some View {
        ZStack {
            Image(viewModel.GetImageName(gameMode: gameMode))
                .resizable()
                .frame(width: viewModel.width, height: viewModel.height)
                
            ButtonView(width: viewModel.buttonWidth, height: viewModel.buttonHeight, text: "MULAI", fontSize: viewModel.buttonFont)
            .padding(.top, 20)
            .offset(CGSize(width: 0, height: viewModel.buttonOffsetY))
        }
        .opacity(viewModel.overlayOpacity)
        .onTapGesture {
            if gameMode == "Online" {
                playMusic(music: "ButtonSound", loop: 0, volume: 0.2)
                navigateToPlayerMenuView = true
            } else {
                playMusic(music: "ButtonSound", loop: 0, volume: 0.2)
                navigateToOfflineGameView = true
            }
            selectedMode = gameMode
        }
        .onAppear() {
            viewModel.SetAppropriateAttribute(selectedMode: selectedMode, gameMode: gameMode)
        }
        .onChange(of: selectedMode) { _ in
            viewModel.SetAppropriateAttribute(selectedMode: selectedMode, gameMode: gameMode)
        }
    }
}
