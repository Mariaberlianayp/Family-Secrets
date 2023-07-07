//
//  PlayerMenuViewModel.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 26/04/23.
//

import Foundation

class PlayerMenuViewModel: ObservableObject {
    
    @Published var selectedPlayerCount: Int = 2
    @Published var navigateToMatchmakingView: Bool = false
    @Published var navigateToGameMenuView: Bool = false
    
    func OnlineGame() {
        navigateToMatchmakingView = true
    }
    
    func GameMenu() {
        navigateToGameMenuView = true
    }
}

extension PlayerMenuView {
    func SavePlayerCount() {
        let newGame: Game
        
        if game.isEmpty {
            newGame = Game(context: managedObjectContext)
        } else {
            newGame = game.first!
        }
        
        newGame.playerCount = Int16(viewModel.selectedPlayerCount)
        
        do {
            try managedObjectContext.save()
            print("Saved")
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
        viewModel.OnlineGame()
    }
}
