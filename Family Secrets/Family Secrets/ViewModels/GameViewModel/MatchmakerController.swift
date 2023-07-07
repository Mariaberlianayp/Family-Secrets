//
//  MatchMakerController.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 27/04/23.
//

import Foundation
import GameKit

extension OnlineGameViewModel: GKMatchmakerViewControllerDelegate {
    func matchmakerViewControllerWasCancelled(_ viewController: GKMatchmakerViewController) {
        viewController.dismiss(animated: true)
    }
    
    func matchmakerViewController(_ viewController: GKMatchmakerViewController, didFailWithError error: Error) {
        viewController.dismiss(animated: true)
        print("Matchmaker vc did fail with error: \(error.localizedDescription).")
    }
    
    func matchmakerViewController(_ viewController: GKMatchmakerViewController, didFind match: GKMatch) {
        viewController.dismiss(animated: true)
        matchFound = true
        StartGame(newMatch: match)
    }
}

extension OnlineGameViewModel {
    var rootViewController: UIViewController? {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return windowScene?.windows.first?.rootViewController
    }
    
    func StartMatchmaking() {
        let request = GKMatchRequest()
        request.minPlayers = playerCount
        request.maxPlayers = playerCount
        request.inviteMessage = "Let's play Family Secrets together!"
        
        let matchmakingViewController = GKMatchmakerViewController(matchRequest: request)
        matchmakingViewController?.matchmakerDelegate = self
        
        rootViewController?.present(matchmakingViewController! , animated: true)
    }
}
