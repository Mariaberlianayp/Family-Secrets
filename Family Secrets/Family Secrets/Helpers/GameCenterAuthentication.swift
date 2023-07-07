//
//  GameCenterAuthentication.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 27/04/23.
//

import Foundation
import GameKit

class GameCenterAuthentication {
    
    func AuthenticateUser() {
        GKLocalPlayer.local.authenticateHandler = { viewController, error in
            
            if GKLocalPlayer.local.isAuthenticated {
                print("Authenticated to Game Center!")
            } else if let vc = viewController {
                viewController?.present(vc, animated: true)
            }
            else {
                print("Error authentication to GameCenter: " +
                      "\(error?.localizedDescription ?? "none")")
            }
        }
    }
}
