//
//  CardMenuView.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 25/04/23.
//

import SwiftUI

struct GameMenuCardSelectionView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Game.entity(), sortDescriptors: []) var game: FetchedResults<Game>
    @StateObject var viewModel = GameMenuCardSelectionViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                HStack(spacing: 10) {
                    GameMenuCardItemView(gameMode: "Online", selectedMode: $viewModel.selectedMode, navigateToPlayerMenuView: $viewModel.navigateToPlayerMenuView, navigateToOfflineGameView: $viewModel.navigateToOfflineGameView)
                    
                    GameMenuCardItemView(gameMode: "Offline", selectedMode: $viewModel.selectedMode, navigateToPlayerMenuView: $viewModel.navigateToPlayerMenuView, navigateToOfflineGameView: $viewModel.navigateToOfflineGameView)
                    }
                }
            }
            .ignoresSafeArea()
            .onChange(of: viewModel.navigateToPlayerMenuView) { _ in
                SaveGameMode()
            }
            .navigationDestination(isPresented: $viewModel.navigateToPlayerMenuView) {
                PlayerMenuView()
                    .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
            }
            .navigationDestination(isPresented: $viewModel.navigateToOfflineGameView) {
                let viewContext = CoreDataManager.shared.persistentStoreContainer.viewContext
                choosePlayerView(vm: OfflineGameViewModel(context: viewContext))
            }
    }
}

struct GameMenuCardSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        GameMenuCardSelectionView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
