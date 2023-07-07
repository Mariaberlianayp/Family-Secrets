//
//  TempCardModel.swift
//  FS-Offline
//
//  Created by Maria Berliana on 02/05/23.
//

import Foundation
import SwiftUI

struct TempCardModel: Identifiable{
    let id = UUID()
    let image:String
    let prompt:String
    let type:String
    let playerName:String
}
