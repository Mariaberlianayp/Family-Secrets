//
//  Card+Extentions.swift
//  FS-Offline
//
//  Created by Maria Berliana on 02/05/23.
//

import Foundation
import CoreData

extension CardOffline: BaseModel{
    static var all: NSFetchRequest<CardOffline>{
        let request = CardOffline.fetchRequest()
        request.sortDescriptors = []
        print("fetching kartu")
        print("kartunya: \(request.sortDescriptors)")
        return request
        
    }
}
