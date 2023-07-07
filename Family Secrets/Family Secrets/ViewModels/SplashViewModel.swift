//
//  SplashViewModel.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 24/04/23.
//

import Foundation
import SwiftUI
import GameKit
import UIKit

class SplashViewModel: ObservableObject {
    
    @Published internal var authenticateButtonOpacity: Double = 0
    @Published var navigateToGameMenu = false
    
    func GameMenu() {
        navigateToGameMenu = true
    }
}

extension SplashView {
    public func loadProfile() {
        
        if profile.isEmpty {
            let newProfile: Profile
            newProfile = Profile(context: managedObjectContext)
            newProfile.username = "Player"
            newProfile.avatar = "avatar_1"
        }
        
        do {
            try managedObjectContext.save()
            print("Saved")
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
