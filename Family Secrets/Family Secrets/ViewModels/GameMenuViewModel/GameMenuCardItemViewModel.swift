//
//  CardSelectionViewModel.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 25/04/23.
//

import Foundation
import SwiftUI

class GameMenuCardItemViewModel: ObservableObject {
    
    @Published var width: Double = 0
    @Published var height: Double = 0
    @Published var overlayOpacity: Double = 0
    @Published var shadowRadius: Double = 0
    @Published var shadowX: Double = 0
    @Published var shadowY: Double = 0
    @Published var textOffset: CGSize = CGSizeZero
    @Published var buttonWidth: Double = 0
    @Published var buttonHeight: Double = 0
    @Published var buttonFont: Double = 0
    @Published var buttonOffsetY: Double = 0
    
    func SetAppropriateAttribute(selectedMode: String, gameMode: String) {
        if selectedMode != gameMode {
            width = 163
            height = 200
            overlayOpacity = 0.5
            shadowX = 2
            shadowY = 4
            shadowRadius = 2
            textOffset = CGSize(width: 0, height: 25)
            buttonWidth = 70
            buttonHeight = 25
            buttonFont = 10
            buttonOffsetY = 50
        } else {
            width = 243
            height = 280
            overlayOpacity = 1
            shadowX = 5
            shadowY = 8
            shadowRadius = 5
            textOffset = CGSizeZero
            buttonWidth = 120
            buttonHeight = 40
            buttonFont = 18
            buttonOffsetY = 80
        }
    }
    
    func GetImageName(gameMode: String) -> String {
        if gameMode == "Online" {
            return "Online_Card"
        } else {
            return "Offline_Card"
        }
    }
}
