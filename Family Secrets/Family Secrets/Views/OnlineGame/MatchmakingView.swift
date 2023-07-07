//
//  MatchmakingView.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 27/04/23.
//

import SwiftUI

struct MatchmakingView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Game.entity(), sortDescriptors: []) var game: FetchedResults<Game>
    @FetchRequest(entity: Profile.entity(), sortDescriptors: []) var profile: FetchedResults<Profile>
    @StateObject var viewModel = OnlineGameViewModel()
    
    var body: some View {
        NavigationStack {
            Image("Background")
                .resizable()
                .onAppear() {
                    playMusic(music: "MatchingSound", loop: -1, volume: 0.2)
                    viewModel.playerCount = Int(game.first!.playerCount)
                    viewModel.StartMatchmaking()
                    viewModel.players.append(Player(id: UUID().uuidString, avatar: profile.first!.avatar!, username: profile.first!.username!))
                }.onDisappear(){
                    stopMusic()
                }
                .navigationDestination(isPresented: $viewModel.matchFound) {
                    OnlineGameView(viewModel: viewModel)
                }
                .navigationBarBackButtonHidden(true)
        }
        .ignoresSafeArea()
    }
}
