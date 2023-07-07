//
//  TutorialMenuViewModel.swift
//  Family Secrets
//
//  Created by Albert Silva on 03/05/23.
//

import Foundation

class TutorialMenuViewModel: ObservableObject {
    @Published var navigateToGameMenuView: Bool = false
    @Published var onlineTutor: Bool = false
    @Published var offlineTutor: Bool = false
    @Published var cardTutor: Bool = false
}
