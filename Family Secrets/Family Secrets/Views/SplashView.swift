//
//  SplashView.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 24/04/23.
//

import SwiftUI

struct SplashView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Profile.entity(), sortDescriptors: []) var profile: FetchedResults<Profile>
    @StateObject private var viewModel = SplashViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Splash_Image")
                    .resizable()
            }
            .ignoresSafeArea()
            .onAppear() {
                loadProfile()
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                    viewModel.navigateToGameMenu = true
                }
            }
            .navigationDestination(isPresented: $viewModel.navigateToGameMenu) {
//
//                if profile.first == nil {
//                    ProfileView()
//                        .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
//                } else {
                    GameMenuView()
//                }
            }
            .onAppear() {
                GameCenterAuthentication().AuthenticateUser()
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView() .previewInterfaceOrientation(.landscapeRight)
    }
}
