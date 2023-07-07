//
//  PlayerMenuCardViewModel.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 25/04/23.
//

import Foundation
import SwiftUI

class PlayerMenuCardItemViewModel: ObservableObject {
    
    @Published var width: Double = 0
    @Published var height: Double = 0
    @Published var overlayOpacity: Double = 0
    @Published var shadowRadius: Double = 0
    @Published var shadowX: Double = 0
    @Published var shadowY: Double = 0
    
    func SetAppropriateAttribute(selectedPlayerCount: Int, playerCount: Int) {
        if selectedPlayerCount != playerCount {
            width = 132
            height = 167
            overlayOpacity = 0.5
            shadowX = 2
            shadowY = 4
            shadowRadius = 2
        } else {
            width = 162
            height = 197
            overlayOpacity = 1
            shadowX = 5
            shadowY = 8
            shadowRadius = 5
        }
    }
}
