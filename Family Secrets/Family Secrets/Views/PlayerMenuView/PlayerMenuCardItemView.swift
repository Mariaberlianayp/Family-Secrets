//
//  PlayerMenuCardItemView.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 25/04/23.
//

import SwiftUI

struct PlayerMenuCardItemView: View {
    
    let playerCount: Int
    let image: String
    @Binding var selectedPlayerCount: Int
    @StateObject var viewModel = PlayerMenuCardItemViewModel()
    
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .frame(width: viewModel.width, height: viewModel.height)
        }
        .opacity(viewModel.overlayOpacity)
        .onTapGesture {
            playMusic(music: "ButtonSound", loop: 0, volume: 0.5)
            selectedPlayerCount = playerCount
        }
        .onAppear() {
            viewModel.SetAppropriateAttribute(selectedPlayerCount: selectedPlayerCount, playerCount: playerCount)
        }
        .onChange(of: selectedPlayerCount) { _ in
            viewModel.SetAppropriateAttribute(selectedPlayerCount: selectedPlayerCount, playerCount: playerCount)
        }
    }
    
}

struct PlayerMenuCardItemView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerMenuCardItemView(playerCount: 1, image: "2_players", selectedPlayerCount: .constant(1))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
