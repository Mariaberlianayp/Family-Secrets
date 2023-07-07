//
//  OnlineGameView.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 26/04/23.
//

import SwiftUI

struct OnlineGameView: View {
    @State var tutorialOpacity: Double = 0
    @StateObject var viewModel: OnlineGameViewModel
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Image("Game_Background")
                    .resizable()
                
                Group {
                    if viewModel.playerCount >= 2 && viewModel.players.count > 1 {
                        Group {
                            PlayerDeckView(basePositionX: 400, basePositionY: 600, gameViewModel: viewModel, playerNo: 1)
                                .rotationEffect(.degrees(90))
                            
                            PlayerAvatarView(player: viewModel.players[1], isActive: viewModel.currentPlayer ==  viewModel.players[1].id, markerRotation: -180)
                                .position(x: 100, y: 300)
                        }
                    }
                    
                    if viewModel.playerCount >= 3 && viewModel.players.count > 2 {
                        Group{
                            PlayerAvatarView(player: viewModel.players[2], isActive: viewModel.currentPlayer ==  viewModel.players[2].id, markerRotation: 0)
                                .position(x: 730, y: 300)
                            
                            PlayerDeckView(basePositionX: 300, basePositionY: 600, gameViewModel:  viewModel,playerNo: 2)
                                .rotationEffect(.degrees(-90))
                        }
                    }
                    
                    if viewModel.playerCount == 4 && viewModel.players.count > 3 {
                        Group {
                            PlayerDeckView(basePositionX: 270, basePositionY: 350, gameViewModel: viewModel, playerNo: 3)
                                .rotationEffect(.degrees(180))
                            
                            PlayerAvatarView(player: viewModel.players[3], isActive: viewModel.currentPlayer ==  viewModel.players[3].id, markerRotation: -180)
                                .position(x: 650, y: 50)
                        }
                    }
                }
                
                // main deck
                Group {
                    GameStackView(gameViewModel: viewModel, type: "AvailableCard")
                    
                    GameStackView(gameViewModel: viewModel, type: "PlayedCard")
                        .offset(CGSize(width: 0, height: -20))
                }
                
                // Local Player
                Group {
                    PlayerAvatarView(player: viewModel.players[0], isActive: viewModel.currentPlayer ==  viewModel.players[0].id, markerRotation: 0)
                        .position(x: 200, y: 350)
                    
                    PlayerDeckView(basePositionX: 300, basePositionY: 360, gameViewModel: viewModel, playerNo: 0)
                }
                
                ChallengeView(gameViewModel: viewModel)
                    .opacity(viewModel.challengeOpacity)
                
                Button {
                } label: {
                    SoundButtonView()
                }
                .position(x: 800, y: 50)
                
                Button {
                    playMusic(music: "ButtonSound", loop: 0, volume: 0.5)
                    tutorialOpacity = 1
                } label: {
                    TutorialButtonView()
                }
                .position(x: 730, y: 50)
                
                TutorialMenuView(tutorialOpacity: $tutorialOpacity)
                    .position(x:  430, y:175)
                    .opacity(tutorialOpacity)
            }
            .ignoresSafeArea()
            .navigationDestination(isPresented: $viewModel.winnerIsDetermined) {
                WinnerView(player: viewModel.GetWinner())
            }.onAppear(){
                playMusic(music: "GameSound", loop: -1, volume: 0.2)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}
