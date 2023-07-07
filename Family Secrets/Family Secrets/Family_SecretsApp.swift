//
//  Family_SecretsApp.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 24/04/23.
//

import SwiftUI

@main
struct Family_SecretsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            SplashView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
