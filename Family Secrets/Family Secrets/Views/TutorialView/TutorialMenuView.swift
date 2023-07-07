//
//  TutorialMenuView.swift
//  Family Secrets
//
//  Created by Albert Silva on 03/05/23.
//

import SwiftUI

struct TutorialMenuView: View {
    @StateObject var viewModel1 = GameMenuViewModel()
    @StateObject var viewModel = TutorialMenuViewModel()
    @State var tutortype = 1
    @State var hover = false
    @Binding var tutorialOpacity: Double
    var body: some View {
        NavigationStack {
            Spacer()
            ZStack{
                ZStack {
                    Color(.white).opacity(0.77)
                    HStack{
                        VStack{
                            Button() {
                                playMusic(music: "ButtonSound", loop: 0, volume: 0.5)
                                tutortype = 1
                            } label: {
                                if(tutortype == 1){
                                    TutorialSelectionButtonView(width: 137, height: 43, text: "ONLINE", hover: true)
                                }else{
                                    TutorialSelectionButtonView(width: 137, height: 43, text: "ONLINE", hover: false)
                                }
                            }.padding(EdgeInsets(top: 10, leading: 0, bottom: 5, trailing: 0))
                            Button() {
                                playMusic(music: "ButtonSound", loop: 0, volume: 0.5)
                                tutortype = 2
                            } label: {
                                if(tutortype == 2){
                                    TutorialSelectionButtonView(width: 137, height: 43, text: "OFFLINE", hover: true)
                                }else{
                                    TutorialSelectionButtonView(width: 137, height: 43, text: "OFFLINE", hover: false)
                                }
                            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                            Button() {
                                playMusic(music: "ButtonSound", loop: 0, volume: 0.5)
                                tutortype = 3
                            } label: {
                                if(tutortype == 3){
                                    TutorialSelectionButtonView(width: 137, height: 43, text: "KARTU", hover: true)
                                }else{
                                    TutorialSelectionButtonView(width: 137, height: 43, text: "KARTU", hover: false)
                                }
                            }
//                            Button{
//                                tutortype = 1
//                            }label:{
//                                Text("ONLINE").font(.system(size: 21, weight: .heavy, design: .rounded))
//                                    .frame(width: 110)
//                                    .foregroundColor(tutortype == 1 ? .white : .black)
//                                            .padding()
//                                            .background(
//                                                ZStack {
//                                                    RoundedRectangle(cornerRadius: 30)
//                                                        .stroke(Color.black, lineWidth: 5)
//                                                }.background(tutortype == 1 ? Color.purple : Color.yellow)
//                                            )
//                                            .cornerRadius(30)
//                            }.padding(EdgeInsets(top: 10, leading: 0, bottom: 5, trailing: 0))
//                            Button{
//                                tutortype = 2
//                            }label:{
//                                Text("OFFLINE").font(.system(size: 21, weight: .heavy, design: .rounded))
//                                    .frame(width: 110)
//                                    .foregroundColor(tutortype == 2 ? .white : .black)
//                                            .padding()
//                                            .background(
//                                                ZStack {
//                                                    RoundedRectangle(cornerRadius: 30)
//                                                        .stroke(Color.black, lineWidth: 5)
//                                                }.background(tutortype == 2 ? Color.purple : Color.yellow)
//                                            )
//                                            .cornerRadius(30)
//                            }.padding(.bottom, 5)
//                            Button{
//                                tutortype = 3
//                            }label:{
//                                Text("KARTU").font(.system(size: 21, weight: .heavy, design: .rounded))
//                                    .frame(width: 110)
//                                    .foregroundColor(tutortype == 3 ? .white : .black)
//                                            .padding()
//                                            .background(
//                                                ZStack {
//                                                    RoundedRectangle(cornerRadius: 30)
//                                                        .stroke(Color.black, lineWidth: 5)
//                                                }.background(tutortype == 3 ? Color.purple : Color.yellow)
//                                            )
//                                            .cornerRadius(30)
//                            }
                            Spacer()
                        }
                        Spacer()
                        TutorialMenuSelectionView(tutortype: $tutortype).frame(width: 550, height: 300).background(.white).cornerRadius(25)
                    }.padding(EdgeInsets(top: 30, leading: 25, bottom: 30, trailing: 25))
                }.frame(width: 740, height: 340).ignoresSafeArea().cornerRadius(30)
                Group {
                    Button {
                        tutorialOpacity = 0
//                        viewModel.navigateToGameMenuView = true
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 19, weight: .heavy, design: .rounded))
                            .background(
                                ZStack{
                                    Circle()
                                        .frame(width: 43, height: 43)
                                        .overlay(RoundedRectangle(cornerRadius: 100)
                                            .stroke(Color.white, lineWidth: 10)
                                        )
                                    Circle()
                                        .fill(LinearGradient(
                                            gradient: .init(colors: [Color(red: 255 / 255, green: 249 / 255, blue: 128 / 255), Color(red: 255 / 255, green: 211 / 255, blue: 77 / 255)]),
                                            startPoint: .init(x: 0.5, y: 0),
                                            endPoint: .init(x: 0.5, y: 0.6)
                                        ))
                                        .frame(width: 43, height: 43)
                                        .overlay(RoundedRectangle(cornerRadius: 100)
                                            .stroke(Color.black, lineWidth: 2)
                                        )
                                    
                                }
                            )
                    }
                    .offset(x:350, y: -155)
                    .navigationDestination(isPresented: $viewModel.navigateToGameMenuView) {
                        GameMenuView()
                    }
                }
                .foregroundColor(.black)
            }.offset(x:0, y: -20)
        }.navigationBarBackButtonHidden(true).ignoresSafeArea()
    }
}


