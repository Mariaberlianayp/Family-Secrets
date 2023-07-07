//
//  GameMenuViewModel.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 25/04/23.
//

import Foundation

class GameMenuViewModel: ObservableObject {
    @Published var navigateToProfileView: Bool = false
    @Published var navigateToSettingsView: Bool = false
    @Published var navigateToTutorialView: Bool = false
}
