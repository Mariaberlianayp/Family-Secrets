//
//  ProfileView.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 24/04/23.
//

import SwiftUI
import CloudKit

struct ProfileView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Profile.entity(), sortDescriptors: []) var profile: FetchedResults<Profile>
    @ObservedObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Background")
                    .resizable()
                
                HStack {
                    ZStack {
                        Image("\(viewModel.selectedAvatar)")
                            .resizable()
                            .frame(width: 200, height: 185)
                            .onTapGesture {
                                viewModel.togglePopover()
                            }
                            .onAppear() {
                                if !profile.isEmpty {
                                    getAvatar()
                                }
                            }
                        
                        Button {
                            playMusic(music: "ButtonSound", loop: 0, volume: 0.5)
                            viewModel.changeAvatar()
                        } label: {
                            Image("Change_Profile")
                                .resizable()
                        }
                        .frame(width: 80, height: 80)
                        .offset(CGSize(width: 60, height: 65))
                    }
                    
                    VStack (alignment: .trailing) {
                        Text("PILIH KARAKTER DAN NAMAMU")
                            .font(.system(size: 22, weight: .heavy, design: .rounded))
                            .bold()
                            .foregroundColor(.white)
                        
                        TextField("\(profile.first?.username ?? "Player")", text: $viewModel.username)
                            .padding(.all)
                            .background(.white)
                            .cornerRadius(50)
                            .overlay( RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.black, lineWidth: 2)
                            )
                            .frame(width: 350, height: 50)
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                        
                        Button() {
                            playMusic(music: "ButtonSound", loop: 0, volume: 0.5)
                            if !profile.isEmpty {
                                saveProfile()
                            } else {
                                createProfile()
                            }
                        } label: {
                            ButtonView(width: 130, height: 50, text: "Simpan", fontSize: 22)
                        }
                        .padding(.top, 10)
                    }
                    .padding(.leading, 20)
                }
                
                Button() {
                    playMusic(music: "ButtonSound", loop: 0, volume: 0.5)
                    viewModel.navigateToGameMenu = true
                } label: {
                    BackButtonView()
                }
                .position(x: 100, y: 40)
            }
            .foregroundColor(Color("Text"))
            .ignoresSafeArea()
            .navigationDestination(isPresented: $viewModel.navigateToGameMenu) {
                GameMenuView()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel())
            .previewInterfaceOrientation(.landscapeRight)
    }
}
