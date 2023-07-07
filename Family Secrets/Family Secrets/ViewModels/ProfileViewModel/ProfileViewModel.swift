//
//  ProfileViewModel.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 24/04/23.
//

import Foundation
import CloudKit
import SwiftUI

class ProfileViewModel: ObservableObject {

    @Published var username: String = ""
    @Published var showPopover: Bool = false
    @Published var selectedAvatar: String = "avatar_1"
    @Published var navigateToGameMenu: Bool = false
    
    func togglePopover() {
        showPopover.toggle()
    }
    
    func changeAvatar() {
        var number = Int(String(selectedAvatar.last!))
        
        if number == 5 {
            number = 1
        } else {
            number! += 1
        }
        selectedAvatar = "avatar_\(number ?? 1)"
    }
}

extension ProfileView {
    
    public func getAvatar() {
        viewModel.selectedAvatar = profile.first?.avatar ?? (profile.first?.avatar!)!
    }
    
    public func saveProfile() {
        
        let newProfile: Profile
        
        if profile.isEmpty {
            newProfile = Profile(context: managedObjectContext)
        } else {
            newProfile = profile.first!
        }
        
        newProfile.username = viewModel.username == "" ? profile.first?.username : viewModel.username
        newProfile.avatar = viewModel.selectedAvatar
        
        do {
            try managedObjectContext.save()
            print("Saved")
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
        viewModel.username = ""
    }
    
    public func createProfile() {
        saveProfile()
        viewModel.navigateToGameMenu = true
        
    }
    
//    nnti diapus cuma buat debug
    public func deleteProfile() {
        self.managedObjectContext.delete(self.profile[0])
        try? managedObjectContext.save()
    }
}
