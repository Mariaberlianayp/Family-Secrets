//
//  OfflineGameView.swift
//  FS-Offline
//
//  Created by Maria Berliana on 28/04/23.
//

import SwiftUI

struct OfflineGameView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: []) var game: FetchedResults<Game>
    @State var playerTotal: Int = UserDefaults.standard.integer(forKey: "playerTotal") ?? 3
    @State var tempPlayer: String = UserDefaults.standard.string(forKey: "tempPlayer") ?? "Player 1"
    
    @State var tempCardImage: String = UserDefaults.standard.string(forKey: "tempCardImage") ?? ""
    @State var tempCardPrompt: String = UserDefaults.standard.string(forKey: "tempCardPrompt") ?? ""
    var vm: OfflineGameViewModel
    
    init(vm: OfflineGameViewModel) {
        self.vm = vm
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    let images = ["image1", "image2", "image2", "image2", "image2"]
    let maxWidth: CGFloat = 167
    @State private var detailCard = false
    @State private var showDoTaskView = false
    @State private var refreshView = false
    @State private var isWin = false
    @State var appeared: Double = 0

    var body: some View {
        NavigationView(){
            ZStack{
                NavigationLink(
                    destination: finishView(vm: vm),
                    isActive: $isWin,
                    label: {
                        EmptyView()
                    }
                )
                
                HStack{
                    VStack(alignment: .leading){
                        HStack{
                            ForEach(vm.players) { player in
                                VStack{
                                    ZStack{
                                        Circle()
                                            .frame(width: 70.0, height: 70.0).foregroundColor(Color.white)
                                            .opacity(player.username == tempPlayer ? 1.0 : 0.0)
                                        Image("\(player.avatar)")
                                            .resizable()
                                            .frame(width: 60.0, height: 60.0)
                                    }
                                    
                                    StrokeTextView(text: "\(player.username)", width: 0.5, color: .black)
                                        .fontWeight(.heavy)
                                        .foregroundColor(Color.white)

                                }.padding()
                                    .opacity(player.username != tempPlayer ? 0.5 : 1.0)
                            }
                            
                        }.padding(.top, 50.0)
                            .padding(.leading, 5.0)
                        
                        
                        GeometryReader { geometry in
                            var playerTempCards = vm.tempCards.filter { $0.playerName == tempPlayer }
                            let imageSize = (geometry.size.width - (CGFloat(playerTempCards.count) - 1) * 10) / CGFloat(playerTempCards.count)
                            let padding = imageSize > maxWidth ? (geometry.size.width - (maxWidth * CGFloat(playerTempCards.count))) / CGFloat(playerTempCards.count - 1) : 10
                            
                            HStack(spacing: padding) {
                                ForEach(playerTempCards) { tempCard in
                                    ZStack{
                                        Image(tempCard.image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .padding(.leading, -60.0)
                                            .frame(width: imageSize)
                                            .shadow(radius: 4,x: 0, y:2)
                                    }.onTapGesture {
                                        detailCard = true
                                    }
                                }
                            }
                        }
                        .padding(.leading, 70.0)
                        .padding(.top, 50.0)
                        .padding(.trailing, 40.0)
                        
                        
                    }
                    VStack(alignment: .trailing){
                        HStack{
                            Image("howTo")
                            Image("sound")
                        }.padding(.top, 60.0)
                        
                        ZStack{
                            ForEach((0..<min(vm.cardPlaying.count, 3)).reversed(), id: \.self) { index in
                                let reversedIndex = vm.cardPlaying.count - index - 1
                                ZStack{
                                    
                                    Image(vm.cardPlaying[reversedIndex].image)
                                        .resizable()
                                        .frame(width: 130.0, height: 180.0)
                                        .aspectRatio(contentMode: .fit)
                                        .shadow(radius: 4,x: 0, y:2)
                                    if(vm.cardPlaying[reversedIndex].type != "spesial"){
                                        Text(vm.cardPlaying[reversedIndex].prompt)
                                            .font(.system(size: 6, weight: .semibold))
                                            .foregroundColor(Color("Brown"))
                                            .multilineTextAlignment(.leading)
                                            .padding(.leading, -20.0)
                                            .frame(width: 70.0)
                                            .padding(.top, 120.0)
                                    }
                                }
                                .padding(
                                    reversedIndex == vm.cardPlaying.count - 2 ?
                                        EdgeInsets(top: 20.0, leading: 20.0, bottom: 0, trailing: 0) :
                                        reversedIndex == vm.cardPlaying.count - 3 ?
                                        EdgeInsets(top: 40.0, leading: 40.0, bottom: 0, trailing: 0) :
                                        EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                                )
                            }


                        }.padding()
                        ZStack{
                            Image("back")
                                .resizable()
                                .frame(width: 100.0, height: 140.0)
                                .aspectRatio(contentMode: .fit)
                                .shadow(radius: 4,x: 0, y:2)
                            Image("back")
                                .resizable()
                                .frame(width: 100.0, height: 140.0)
                                .aspectRatio(contentMode: .fit)
                                .padding([.top, .leading], -20.0)
                                .shadow(radius: 4,x: 0, y:2)
                            Image("back")
                                .resizable()
                                .frame(width: 100.0, height: 140.0)
                                .aspectRatio(contentMode: .fit)
                                .padding([.top, .leading], -40.0)
                                .shadow(radius: 4,x: 0, y:2)
                            NavigationLink(
                                destination: OfflineGameView(vm:vm),
                                isActive: $refreshView,
                                label: {
                                    EmptyView()
                                }
                            )
                        }.padding(.bottom, -70.0)
                        .padding(20)
                        .onTapGesture{
                            vm.addToTempCard(tempPlayer: tempPlayer)
                            refreshView = true
                        }
                        
                    }
                    
                }.background(Image("BGinGame"))
                    .background(Color.black.opacity(detailCard ? 0.8 : 0))
                .blur(radius: detailCard ? 5 : 0)
                
                if detailCard {
                    VStack{
                        StrokeTextView(text: "PILIH KARTU YANG INGIN KAMU MAINKAN", width: 2.0, color: .black)
                            .foregroundColor(Color.white)
                            .font(.system(size: 24, weight: .heavy))
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            let playerTempCards = vm.tempCards.filter { $0.playerName == tempPlayer }
                            HStack{
                                NavigationLink(
                                    destination: doTaskView(prompt: $tempCardPrompt, image: $tempCardImage, vm:vm),
                                    isActive: $showDoTaskView,
                                    label: {
                                        EmptyView()
                                    }
                                ).onChange(of: showDoTaskView) { newValue in
                                    if newValue == false {
                                        detailCard = false
                                    }
                                }
                                
                                ForEach(Array(playerTempCards.enumerated()), id: \.element.id) { (index, tempCard) in
  
                                    ZStack{
                                        Image(tempCard.image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 150.0, height: 200.0)
                                            .shadow(radius: 4,x: 0, y:2)
                                        if(tempCard.type != "spesial"){
                                            Text(tempCard.prompt)
                                                .font(.system(size: 7, weight: .semibold))
                                                .foregroundColor(Color("Brown"))
                                                .multilineTextAlignment(.leading)
                                                .frame(width: 90)
                                                .padding(.top, 140)
                                                .padding(.leading, -23.0)
                                        }
                                        
                                    }.onTapGesture{
                                        
                                        tempCardPrompt = tempCard.prompt
                                        tempCardImage = tempCard.image
                                        
                                        print("Kartu sebelum: \(tempCard.prompt), \(tempCardPrompt)")
                                        
                                        UserDefaults.standard.set(tempCardPrompt, forKey: "tempCardPrompt")
                                        UserDefaults.standard.set(tempCardImage, forKey: "tempCardImage")
                                        
                                        
                                        var tempPlayers:Int = (vm.extractInteger(from: tempPlayer) ?? 1)
                                        var nextPlayer:String = "Player \(tempPlayers + 1)"
                                        
                                        if(vm.cardPlaying[vm.cardPlaying.count-1].type != "spesial"){
                                            if(vm.extractInteger(from: vm.cardPlaying[vm.cardPlaying.count-1].image) == 1)
                                            {
                                                if tempCard.type == "ask" || tempCard.type == "truth" {
                                                    vm.playerCardToCardPlaying(tempCardID: tempCard.id)
                                                    if (playerTempCards.count == 1) {
                                                        isWin = true
                                                    }
                                                    showDoTaskView = true
                                                    
                                                }
                                                else if (tempCard.type == "spesial")
                                                {
                                                    if(tempCard.image == "changeColor")
                                                    {
                                                        refreshView = true
                                                        vm.playerCardToCardPlaying(tempCardID: tempCard.id)
                                                        if (playerTempCards.count == 1) {
                                                            isWin = true
                                                        }
                                                    }
                                                    else
                                                    {
                                                        
                                                        vm.addPlusCard(tempPlayer: nextPlayer, tempCardImage: tempCard.image)
                                                        vm.playerCardToCardPlaying(tempCardID: tempCard.id)
                                                        if (playerTempCards.count == 1) {
                                                            isWin = true
                                                        }
                                                        showDoTaskView = true
                                                    }
                                                    
                                                }
                                                
                                            }else if(vm.extractInteger(from: vm.cardPlaying[vm.cardPlaying.count-1].image) == 2)
                                            {
                                                if tempCard.type == "ask" || tempCard.type == "dare" {
                                                    vm.playerCardToCardPlaying(tempCardID: tempCard.id)
                                                    if (playerTempCards.count == 1) {
                                                        isWin = true
                                                    }
                                                    showDoTaskView = true
                                                    
                                                }
                                                else if (tempCard.type == "spesial")
                                                {
                                                    if(tempCard.image == "changeColor")
                                                    {
                                                        refreshView = true
                                                        vm.playerCardToCardPlaying(tempCardID: tempCard.id)
                                                    }
                                                    else
                                                    {
                                                        vm.addPlusCard(tempPlayer: nextPlayer, tempCardImage: tempCard.image)
                                                        vm.playerCardToCardPlaying(tempCardID: tempCard.id)
                                                        if (playerTempCards.count == 1) {
                                                            isWin = true
                                                        }
                                                        showDoTaskView = true
                                                    }
                                                    
                                                }
                                            }
                                            else
                                            {
                                                if tempCard.type == "truth" || tempCard.type == "dare" {
                                                    vm.playerCardToCardPlaying(tempCardID: tempCard.id)
                                                    if (playerTempCards.count == 1) {
                                                        isWin = true
                                                    }
                                                    showDoTaskView = true
                                                }
                                                else if (tempCard.type == "spesial")
                                                {
                                                    if(tempCard.image == "changeColor")
                                                    {
                                                        refreshView = true
                                                        vm.playerCardToCardPlaying(tempCardID: tempCard.id)
                                                    }
                                                    else
                                                    {
                                                       
                                                        vm.addPlusCard(tempPlayer: nextPlayer, tempCardImage: tempCard.image)
                                                        vm.playerCardToCardPlaying(tempCardID: tempCard.id)
                                                        if (playerTempCards.count == 1) {
                                                            isWin = true
                                                        }
                                                        showDoTaskView = true
                                                    }
                                                    
                                                }
                                            }
                                           
                                        }
                                        else{
                                            if(tempCard.image == "changeColor")
                                            {
                                                refreshView = true
                                                vm.playerCardToCardPlaying(tempCardID: tempCard.id)
                                            }
                                            else if (tempCard.image != "changeColor")
                                            {
                                               
                                                vm.addPlusCard(tempPlayer: nextPlayer, tempCardImage: tempCard.image)
                                                vm.playerCardToCardPlaying(tempCardID: tempCard.id)
                                                if (playerTempCards.count == 1) {
                                                    isWin = true
                                                }
                                                showDoTaskView = true
                                            }
                                            else{
                                                vm.playerCardToCardPlaying(tempCardID: tempCard.id)
                                                if (playerTempCards.count == 1) {
                                                    isWin = true
                                                }
                                                showDoTaskView = true
                                            }
                                            
                                        }
                                    }
                                    
                                }
                            }
                            
                        }
                        Button(action: {
                            playMusic(music: "ButtonSound", loop: 0, volume: 0.5)
                            detailCard = false
                        }) {
                            Image(systemName: "arrowtriangle.backward.fill")
                                .foregroundColor(.white)
                                .padding([.top, .leading], -5.0)
                            Text("KEMBALI")
                                .fontWeight(.heavy)
                                .foregroundColor(Color.white)
                                .padding(.top, -7.0)
                                
                        }.background(Image("Button2"))
                        .padding(.top, 30.0)
                        .padding(.leading, 550.0)
                    }
                }
                
            }
        }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarBackButtonHidden(true)
            .onAppear{
                if(refreshView)
                {
                    refreshView = false
                }
                if(showDoTaskView)
                {
                    showDoTaskView = false
                }
            }
        
    }
 
    
    
}

struct OfflineGameView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = CoreDataManager.shared.persistentStoreContainer.viewContext
        OfflineGameView(vm: OfflineGameViewModel(context: viewContext)).previewInterfaceOrientation(.landscapeRight)
    }
}
