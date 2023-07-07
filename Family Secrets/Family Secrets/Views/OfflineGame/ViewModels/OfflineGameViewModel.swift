//
//  OfflineGameViewModel.swift
//  FS-Offline
//
//  Created by Maria Berliana on 28/04/23.
//

import Foundation
import CoreData


@MainActor
class OfflineGameViewModel: NSObject, ObservableObject {
    @Published var type: String = ""
    @Published var image: String = ""
    @Published var prompt: String = ""
    
    @Published var cards = [CardViewModel]()
    @Published var players: [PlayerOffline] = []
    @Published var tempCards: [TempCardModel] = []
    @Published var mixCard: [MixCardModel] = []
    @Published var cardPlaying: [MixCardModel] = []
    
    private let fetchResultsController: NSFetchedResultsController<CardOffline>
    
    private (set) var context: NSManagedObjectContext
    init(context: NSManagedObjectContext) {
        self.context = context
        fetchResultsController = NSFetchedResultsController(fetchRequest: CardOffline.all, managedObjectContext: context , sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        fetchResultsController.delegate = self
        do{
            try fetchResultsController.performFetch()
            guard let cards = fetchResultsController.fetchedObjects else{
                return
            }
            self.cards = cards.map(CardViewModel.init)
        }catch{
            print(error)
        }
        
        
    }
    
    func save(){
        
        do{
            let promptsTruth = [
                "Apa 3 momen keluarga yang paling kamu suka?",
                "Apakah kamu rela menukar saudaramu untuk mendapat 1M?",
                "Apakah kamu pernah mencuri sesuatu dari anggota keluargamu?",
                "Apa kamu pernah berbohong sedang sakit?",
                "Apa cita-citamu yang belum terwujud?",
                "Apa mimpi terburuk yang pernah kamu alami?",
                "Apa 1 hal yang keluarga tidak ketahui tentang dirimu?",
                "Apa yang biasa kamu lakukan di waktu luang?",
                "Kapan terakhir kali kamu ngompol di celana?",
                "Apa 1 kebiasaan buruk yang anda miliki?",
                "Apakah kamu pernah makan makanan yang sudah jatuh ke lantai?",
                "Apa 1 tempat yang tidak akan kamu kunjungi lagi?",
                "Apa 1 hal yang sedang kamu inginkan?",
                "Siapa orang yang paling lucu disini?",
                "Siapa orang yang paling galak disini?",
                "Siapa orang yang paling perhatian disini?",
                "Apakah kamu pernah nyontek?",
                "Apakah kamu pernah mengambil barang tanpa izin?",
                "Apakah kamu ingin memilki hewan peliharaan?",
                "Apa hal yang paling membuatmu merasa insecure?",
                "Apa penyesalan terburukmu?",
                "Apa yang akan kamu lakukan jika kamu bisa menjadi transparan?",
                "Menurutmu hewan apa yang paling mirip denganmu?",
                "Apa harapan terbesar yang kamu inginkan untuk keluargamu?",
                "Hal terburuk apa yang pernah oranglain lakukan padamu?",
                "Apa kebiasaan buruk yang ingin kamu ubah?",
                "Apakah kamu punya bakat terpendam?",
                "Apa hal tergila yang pernah kamu lakukan?",
                "Situasi apa yang membuat kamu bahagia?",
                "Sikap apa yang membuatmu merasa diperlakukan spesial?",
                "Apa nama panggilan teraneh yang kamu punya?",
                "Apa satu hal yang kamu tidak bisa hidup tanpanya?",
                "Apa pencapaian terbesarmu hingga saat ini?",
                "Gambarkan dirimu dalam tiga kata!",
                "Apa karir impianmu?",
                "Hal apa yang paling membuatmu tidak percaya diri?"
            ]

            for i in 0..<promptsTruth.count {
                let card = CardOffline(context: context)
                card.type = "truth"
                card.image = "truth\(randomIndex())"
                card.prompt = promptsTruth[i]
                try card.save()
            }
            
            let promptsDare = [
                "Nyanyikan lagu favoritmu saat ini!",
                "Peragakan hewan favoritmu!",
                "Tunjukkan bakat rahasiamu!",
                "Gendong salah satu pemain!",
                "Peragakan 1 pemain hingga pemain lain dapat menebaknya!",
                "Cium pipi pemain setelahmu!",
                "Biarkan semua pemain menata gaya rambutmu!",
                "Tarikan salah satu dance challenge yang lagi viral!",
                "Biarkan wajahmu dihias seperti badut oleh pemain lain!",
                "Buat video senam lalu unggah di salah satu media sosialmu!",
                "Tutup mata lalu raba wajah 1 pemain dan tebak siapa dia!",
                "Ulangi perkataan semua pemain hingga giliranmu berikutnya!",
                "Tirukan ekspresi 5 emoji!",
                "Berbicara seperti penyanyi opera hingga giliranmu berikutnya!",
                "Buatkan pantun untuk keluargamu!",
                "Telpon sepupumu dan tanya \"ada yang bisa kami bantu?\"",
                "Peragakan pekerjaan cita-citamu hingga ada yang bisa menebaknya",
                "Gambar lingkaran di kertas menggunakan mulut!",
                "Nyanyikan 1 lagu menggunakan nama pemain setelahmu!",
                "Biarkan salah satu pemain kuncir rambutmu!",
                "Tirukan suara hewan kesukaanmu!",
                "Upload selfie dengan filter yang dipilih oleh pemain setelahmu!",
                "Edit fotomu sesuai karir impianmu dan upload ke medsos!",
                "Tirukan suara kartun favoritmu hingga giliranmu berikutnya!",
                "Nyanyikan 1 lagu dengan meniru suara salah satu pemain!",
                "Telpon 1 anggota keluarga (random) dan nyanyikan lagu!",
                "Nyanyikan lagu daerah asalmu dan upload ke medsos!",
                "Tirukan suara hewan favorit pemain setelahmu!",
                "Coba promosikan barang favoritmu layaknya iklan!",
                "Bepura-puralah menjadi robot hingga giliranmu selanjutnya!",
                "Ceritakan kisah cinta pertamamu!",
                "Katakan \"Meong\" diakhir kalimat hingga giliranmu berikutnya!",
                "Berbicara dengan aksen Prancis hingga giliranmu berikutnya!",
                "Tirukan 1 suara aktor terkenal hingga dapat ditebak pemain lain!",
                "Bilang “I Love You” ke pemain berikutnya!",
                "Baca 1 puisi yang ditentukan pemain selanjutnya!"
            ]

            for i in 0..<promptsDare.count {
                let card2 = CardOffline(context: context)
                card2.type = "dare"
                card2.image = "dare\(randomIndex())"
                card2.prompt = promptsDare[i]
                try card2.save()
            }
            
            let promptsQuestion = [
                "Apa makanan/minuman favoritmu?",
                "Apa lagu favoritmu?",
                "Apa film favoritmu?",
                "Apakah kamu takut dengan hantu?",
                "Apakah first impression kamu terhadap aku?",
                "Dimana tempat wisata favoritmu?",
                "Apa hobi yang paling kamu sukai?",
                "Apa 1 hal yang paling kamu suka dari diriku?",
                "Sebutkan 1 hal yang kamu kurang suka dari diriku",
                "Apa ekspektasimu terhadap aku?",
                "Apa hewan kesukaanmu?",
                "Apakah kamu pernah merasa kecewa dengan keluarga?",
                "Apa hal terakhir yang membuatmu menangis?",
                "Jika kamu bertemu peri, apa tiga permintaanmu?",
                "Apa hal terbaik yang pernah orang lain lakukan kepadamu?",
                "Apa satu hal yang kamu harap dapat kamu ubah dari dirimu?",
                "Apakah kamu pernah berbohong kepadaku?",
                "Dimanakah tempat tinggal impianmu?",
                "Gambarkan diriku dalam tiga kata!",
                "Apa hal paling menakutkan yang pernah kamu alami?",
                "Apa kenangan masa kecil terbaikmu?",
                "Apa liburan impianmu?",
                "Apa kombinasi makanan teraneh yang kamu suka?",
                "Apa mimpi teraneh yang pernah kamu alami?",
                "Apa yang tidak diketahui orang mengenai kamu?",
                "Apa nama panggilan teraneh yang pernah orang berikan padamu?",
                "Apa kelemahan terbesarmu?",
                "Dimana tempat berlibur impianmu?",
                "Apa pekerjaan impianmu?",
                "Hal apa yang membuatmu sangat terganggu?",
                "Apa genre film kesukaanmu?",
                "Apa yang paling kamu takutkan ketika nanti tua?",
                "Apakah kamu takut gelap?",
                "Siapa yang menjadi panutan hidupmu?",
                "Apa hewan yang kamu takuti?",
                "Apakah kamu percaya dengan keberadaan hantu?"
            ]

            for i in 0..<promptsQuestion.count {
                let card3 = CardOffline(context: context)
                card3.type = "ask"
                card3.image = "ask\(randomIndex())"
                card3.prompt = promptsQuestion[i]
                try card3.save()
            }
            
            let promptsSpesial = [
                "changeColor", "plus1", "plus2", "plus3", "plus4","changeColor", "plus1", "plus2", "plus3", "plus4","changeColor", "plus1", "plus2", "plus3", "plus4","changeColor", "plus1", "plus2", "plus3", "plus4"
            ]

            for i in 0..<promptsSpesial.count {
                let card3 = CardOffline(context: context)
                card3.type = "spesial"
                card3.image = promptsSpesial[i]
                card3.prompt = promptsSpesial[i]
                try card3.save()
            }
            
        }catch{
            print(error)
        }
    }
    
    func randomIndex() -> Int {
        return Int.random(in: 1..<4)
    }
    
    func mixingCards() {
            let fetchRequest: NSFetchRequest<CardOffline> = CardOffline.fetchRequest()
  
            let sortDescriptor = NSSortDescriptor(key: "id", ascending: true)
            fetchRequest.sortDescriptors = [sortDescriptor]
            
            do {
                
                var shuffledCards = cards.shuffled()
                var mixedCards: [MixCardModel] = []
                
                while !shuffledCards.isEmpty {
                    let card = shuffledCards.removeFirst()
                    let MixCard = MixCardModel(image: card.image, prompt: card.prompt, type: card.type)
                    mixedCards.append(MixCard)
                }
                
                mixCard = mixedCards
                
            } catch {
                print("Error fetching cards: \(error)")
            }
        }
    //random 5 card
    func takeFive(playerName: String) {
        if mixCard.count >= 5 {
            var newCards: [TempCardModel] = []
            for _ in 1...5 {
                let randomIndex = Int.random(in: 0..<mixCard.count)
                let randomCard = mixCard[randomIndex]
                let newCard = TempCardModel(image: randomCard.image, prompt: randomCard.prompt, type: randomCard.type, playerName: playerName)
                newCards.append(newCard)
                mixCard.remove(at: randomIndex)
            }
            self.tempCards.append(contentsOf: newCards)
        }
    }

    func asignPlayerCard(playerID:Int){
        var temp:Int = 1
        for _ in 0..<playerID{
            let username:String = "Player \(temp)"
            let avatar:String = "game_avatar_\(temp)"
            let player = PlayerOffline(username: username, avatar: avatar)
            players.append(player)
            temp = temp + 1
            takeFive(playerName: username)
        }
        
    }
    
    func asignCardPlaying(){
        let randomIndex = Int.random(in: 0..<mixCard.count)
        let randomCard = mixCard[randomIndex]
        let newCard = MixCardModel(image: randomCard.image, prompt: randomCard.prompt, type: randomCard.type)
        let newTempCard = TempCardModel(image: randomCard.image, prompt: randomCard.prompt, type: randomCard.type, playerName: "Player 1")
        cardPlaying.append(newCard)
        mixCard.remove(at: randomIndex)
        if cardPlaying[0].image == "plus1" {

            tempCards.append(newTempCard)
            mixCard.remove(at: randomIndex)
            
        } else if cardPlaying[0].image == "plus2" {
            for _ in 1...2 {
                tempCards.append(newTempCard)
                mixCard.remove(at: randomIndex)
            }
        } else if cardPlaying[0].image == "plus3" {
            for _ in 1...3 {
                tempCards.append(newTempCard)
                mixCard.remove(at: randomIndex)
            }
        } else if cardPlaying[0].image == "plus4" {
            for _ in 1...4 {
                tempCards.append(newTempCard)
                mixCard.remove(at: randomIndex)
            }
        }


        
    }
    
    func playerCardToCardPlaying(tempCardID:UUID){
        if let index = tempCards.firstIndex(where: { $0.id == tempCardID }) {
            let tempCard = tempCards[index]
            let playingCard = MixCardModel(image: tempCard.image, prompt: tempCard.prompt, type: tempCard.type)
            cardPlaying.append(playingCard)
            tempCards.remove(at: index)
        }
        

    }
    func addPlusCard(tempPlayer: String, tempCardImage: String){
        let randomIndex = Int.random(in: 0..<mixCard.count)
        let randomCard = mixCard[randomIndex]
        let newTempCard = TempCardModel(image: randomCard.image, prompt: randomCard.prompt, type: randomCard.type, playerName: tempPlayer)
        if(extractInteger(from: tempCardImage) == 1)
        {
            tempCards.append(newTempCard)
            mixCard.remove(at: randomIndex)
        }else if (extractInteger(from: tempCardImage) == 2) {
            
            tempCards.append(newTempCard)
            mixCard.remove(at: randomIndex)
            tempCards.append(newTempCard)
            mixCard.remove(at: randomIndex)
        
        } else if (extractInteger(from: tempCardImage) == 3) {
           
            tempCards.append(newTempCard)
            mixCard.remove(at: randomIndex)
            tempCards.append(newTempCard)
            mixCard.remove(at: randomIndex)
            tempCards.append(newTempCard)
            mixCard.remove(at: randomIndex)
            
        } else if (extractInteger(from: tempCardImage) == 4) {
            
            tempCards.append(newTempCard)
            mixCard.remove(at: randomIndex)
            tempCards.append(newTempCard)
            mixCard.remove(at: randomIndex)
            tempCards.append(newTempCard)
            mixCard.remove(at: randomIndex)
            tempCards.append(newTempCard)
            mixCard.remove(at: randomIndex)
            
        }
        
        
    }
    func addToTempCard(tempPlayer: String){
        let randomIndex = Int.random(in: 0..<mixCard.count)
        let randomCard = mixCard[randomIndex]
        let newTempCard = TempCardModel(image: randomCard.image, prompt: randomCard.prompt, type: randomCard.type, playerName: tempPlayer)
        tempCards.append(newTempCard)
        mixCard.remove(at: randomIndex)
    }
    
    func extractInteger(from string: String) -> Int? {
        let components = string.components(separatedBy: CharacterSet.decimalDigits.inverted)
        let integers = components.compactMap { Int($0) }
        return integers.first
    }
    

}

extension OfflineGameViewModel: NSFetchedResultsControllerDelegate{
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let cards = controller.fetchedObjects as? [CardOffline] else{
            return
        }
        self.cards = cards.map(CardViewModel.init)
    }
    
}

struct CardViewModel: Identifiable{
    private var card: CardOffline
    init(card: CardOffline) {
        self.card = card
    }
    var id: NSManagedObjectID{
        self.card.objectID
    }
    var type: String{
        card.type ?? ""
    }
    var image: String{
        card.image ?? ""
    }
    var prompt: String{
        card.prompt ?? ""
    }
    
    
}
