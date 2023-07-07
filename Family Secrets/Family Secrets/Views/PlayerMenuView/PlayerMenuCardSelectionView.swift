//
//  PlayerMenuCardSelectionView.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 25/04/23.
//

import SwiftUI

struct PlayerMenuCardSelectionView: View {
    
    @Binding var selectedPlayerCount: Int
    
    var body: some View {
        ZStack {
            HStack(spacing: 10) {
                PlayerMenuCardItemView(playerCount: 2, image: "2_players", selectedPlayerCount: $selectedPlayerCount)
                
                PlayerMenuCardItemView(playerCount: 3, image: "3_players", selectedPlayerCount: $selectedPlayerCount)
                
                PlayerMenuCardItemView(playerCount: 4, image: "4_players", selectedPlayerCount: $selectedPlayerCount)
            }
        }
        .ignoresSafeArea()
    }
}

struct PlayerMenuCardSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerMenuCardSelectionView(selectedPlayerCount: .constant(2))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
