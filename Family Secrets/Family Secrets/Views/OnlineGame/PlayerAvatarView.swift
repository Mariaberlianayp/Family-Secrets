//
//  PlayerAvatarView.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 27/04/23.
//

import SwiftUI

struct PlayerAvatarView: View {
    
    let avatarSize: Double = 50
    let player: Player
    let width: Double = 0.1
    let shadowRadius: Double = 0.4
    let isActive: Bool
    let markerRotation: Double
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    Image("Active_Marker")
                        .offset(CGSize(width: 4, height: 0))
                        .rotationEffect(.degrees(markerRotation))
                        .opacity(getMarkerOpacity())
                    
                    Circle()
                        .frame(width: avatarSize + 2, height: avatarSize + 2)
                    
                    Image("game_avatar_\(getGameAvatarImage())")
                        .resizable()
                        .frame(width: avatarSize, height: avatarSize)
                        .cornerRadius(100)
                }
                .padding(.bottom, -5)
                
                OutlineTextView(text: player.username, fontSize: 16)
            }
        }
    }
    
    func getMarkerOpacity() -> Double {
        if isActive {
            return 1
        }
        return 0
    }
    
    func getGameAvatarImage() -> String {
        return String(player.avatar.last!)
    }
}

struct PlayerAvatarView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerAvatarView(player: Player(id: "abc", avatar: "avatar_1", username: "Reina"), isActive: true, markerRotation: 0)
    }
}
