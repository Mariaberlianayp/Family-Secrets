//
//  PlayerMenuView.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 25/04/23.
//

import SwiftUI

struct PlayerMenuView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Game.entity(), sortDescriptors: []) var game: FetchedResults<Game>
    @StateObject var viewModel = PlayerMenuViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Background")
                    .resizable()
                
                VStack {
                    Text("BERAPA ORANG YANG AKAN BERMAIN?")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .heavy, design: .rounded))
                        .bold()
                    
                    PlayerMenuCardSelectionView(selectedPlayerCount: $viewModel.selectedPlayerCount)
                        .padding(.top, 10)
                    
                    Button() {
                        playMusic(music: "ButtonSound", loop: 0, volume: 0.5)
                        SavePlayerCount()
                        stopMusic()
                    } label: {
                        PlayButtonView(width: 200, height: 40, text: "SELANJUTNYA")
                    }
                    .offset(CGSize(width: 290, height: 20))
                    .padding(.top, -20)
                }
                .frame(height: 300)
                .padding(.top, 20)
                
                Button() {
                    playMusic(music: "ButtonSound", loop: 0, volume: 0.5)
                    viewModel.GameMenu()
                } label: {
                    BackButtonView()
                }
                .position(x: 100, y: 40)
            }
            .ignoresSafeArea()
            .navigationDestination(isPresented: $viewModel.navigateToMatchmakingView) {
                MatchmakingView()
            }
            .navigationDestination(isPresented: $viewModel.navigateToGameMenuView) {
                GameMenuView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct PlayerMenuView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerMenuView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
