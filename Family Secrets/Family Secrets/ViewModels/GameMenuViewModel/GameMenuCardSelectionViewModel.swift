//
//  GameMenuCardSelectionViewModel.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 25/04/23.
//

import Foundation

class GameMenuCardSelectionViewModel: ObservableObject {
    
    @Published var selectedMode: String = "Online"
    @Published var navigateToPlayerMenuView: Bool = false
    @Published var navigateToOfflineGameView: Bool = false
    
    func PlayerMenuView() {
        navigateToPlayerMenuView = true
    }
}

extension GameMenuCardSelectionView {
    func SaveGameMode() {
        let newGame: Game
        
        if game.isEmpty {
            newGame = Game(context: managedObjectContext)
        } else {
            newGame = game.first!
        }
        
        newGame.gameMode = viewModel.selectedMode
        
        do {
            try managedObjectContext.save()
            print("Saved")
            viewModel.PlayerMenuView()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
