//
//  CoreDataManager.swift
//  FS-Offline
//
//  Created by Maria Berliana on 02/05/23.
//

import Foundation
import CoreData

class CoreDataManager{
    let persistentStoreContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    
    private init(){
        persistentStoreContainer = NSPersistentContainer(name: "FamilySecrets")
        persistentStoreContainer.loadPersistentStores{ description, error in
            if let error = error{
                fatalError("unable to initialize \(error)")
                
            }

        }
        
    }
}
