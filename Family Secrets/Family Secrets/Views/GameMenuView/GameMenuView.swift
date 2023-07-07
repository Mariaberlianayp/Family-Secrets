//
//  GameMenuView.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 25/04/23.
//

import SwiftUI

struct GameMenuView: View {
    @State var tutorialOpacity: Double = 0
    @StateObject var viewModel = GameMenuViewModel()
    @State var isPlayed: Bool = false
    @State var mute: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Background")
                    .resizable()
                
                GameMenuCardSelectionView()
                    .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
                
                Group {
                    Button {
                        playMusic(music: "ButtonSound", loop: 0, volume: 0.5)
                        viewModel.navigateToProfileView = true
                    } label: {
                        ProfileButtonView()
                    }
                    .position(x: 50, y: 50)
                    .navigationDestination(isPresented: $viewModel.navigateToProfileView) {
                        ProfileView()
                            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
                    }
                    
                    Button {
                        playMusic(music: "ButtonSound", loop: 0, volume: 0.5)
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
                    .position(x: 800, y: 110)
                    
                }
                .foregroundColor(.white)
                .navigationBarBackButtonHidden(true)
                TutorialMenuView(tutorialOpacity: $tutorialOpacity).position(x: 430, y: 175)
                    .opacity(tutorialOpacity)
            }
            .ignoresSafeArea()
            .onAppear() {
                if(isPlayed == false){
                    playMusic(music: "HomeSound", loop: -1, volume: 0.2)
                    isPlayed = true
                }
            }
        }
    }
}

struct GameMenuView_Previews: PreviewProvider {
    static var previews: some View {
        GameMenuView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
