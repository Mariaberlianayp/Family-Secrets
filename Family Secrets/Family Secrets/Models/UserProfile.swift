//
//  Profile.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 24/04/23.
//

import Foundation
import CloudKit

struct UserProfile {
    
    var profileID: CKRecord.ID?
    var username: String
    
    init(profileID: CKRecord.ID? = nil, username: String) {
        self.profileID = profileID
        self.username = username
    }
    
    func convertToDictionary() -> [String: Any] {
        return ["username": username]
    }
}
