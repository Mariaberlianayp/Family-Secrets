//
//  TutorialMenuSelectionView.swift
//  Family Secrets
//
//  Created by Albert Silva on 03/05/23.
//

import SwiftUI

struct TutorialMenuSelectionView: View {
    @StateObject var viewModel = TutorialMenuViewModel()
    let imageSize = 240.0
    let titleFontSize = 24.0
    let descriptionFontSize = 16.0
    @Binding var tutortype: Int
    var body: some View {
        if(tutortype == 1){
            VStack {
                Spacer()
                Text("CARA BERMAIN ONLINE").font(.system(size: 24, weight: .heavy, design: .rounded))
                    .padding(.top, 20)
                TabView {
                    VStack {
                        Spacer()
                        Image("TutOn1")
                            .resizable()
                            .aspectRatio(contentMode: .fit).frame(width: imageSize)
                        Spacer()
                        Text("Pertama-tama tentukan alat komunikasi yang akan digunakan selama bermain **(Discord, Whatsapp, Line, dll)**").font(.system(size: descriptionFontSize, design: .rounded))
                            .multilineTextAlignment(.center).frame(width: 350)
                        Spacer()
                    }.padding(.bottom, 20)
                    VStack {
                        Spacer()
                        Image("TutOn2")
                            .resizable()
                            .aspectRatio(contentMode: .fit).frame(width: imageSize)
                        Spacer()
                        Text("Kemudian pilih **Mode Online** dan **jumlah pemain** yang akan ikut bermain")
                            .font(.system(size: descriptionFontSize, design: .rounded))
                            .multilineTextAlignment(.center).frame(width: 350)
                        Spacer()
                    }.padding(.bottom, 20)
                    VStack {
                        Spacer()
                        Image("TutOn3")
                            .resizable()
                            .aspectRatio(contentMode: .fit).frame(width: imageSize)
                        Spacer()
                        Text("Tunggu semua pemain masuk ke ruang permainan, dan tekan tombol **Mulai**")
                            .font(.system(size: descriptionFontSize, design: .rounded))
                            .multilineTextAlignment(.center).frame(width: 350)
                        Spacer()
                    }.padding(.bottom, 20)
                    VStack {
                        Spacer()
                        Image("TutOn4")
                            .resizable()
                            .aspectRatio(contentMode: .fit).frame(width: imageSize)
                        Spacer()
                        Text("Pada awal permainan, setiap pemain akan diberikan **5 kartu** secara acak")
                            .font(.system(size: descriptionFontSize, design: .rounded))
                            .multilineTextAlignment(.center).frame(width: 350)
                        Spacer()
                    }.padding(.bottom, 20)
                    VStack {
                        Spacer()
                        Image("TutOn5")
                            .resizable()
                            .aspectRatio(contentMode: .fit).frame(width: imageSize)
                        Spacer()
                        Text("Pada gilirannya, pemain harus mengeluarkan **1 kartu** sesuai dengan warna lingkaran yang terdapat pada bagian atas atau bawah kartu")
                            .font(.system(size: descriptionFontSize, design: .rounded))
                            .multilineTextAlignment(.center).frame(width: 350)
                        Spacer()
                    }.padding(.bottom, 20)
                    VStack {
                        Spacer()
                        Image("TutOn6")
                            .resizable()
                            .aspectRatio(contentMode: .fit).frame(width: imageSize)
                        Spacer()
                        Text("Setelah mengeluarkan kartu yang dipilih, kamu harus melakukan **tantangan** yang tertulis pada kartu tersebut sebelum bisa melanjutkan permainan")
                            .font(.system(size: descriptionFontSize, design: .rounded))
                            .multilineTextAlignment(.center).frame(width: 350)
                        Spacer()
                    }.padding(.bottom, 20)
                    VStack {
                        Spacer()
                        Image("TutOn7")
                            .resizable()
                            .aspectRatio(contentMode: .fit).frame(width: imageSize)
                        Spacer()
                        Text("Jika pemain tidak memiliki kartu dengan warna yang sesuai maka pemain harus mengambil kartu dari deck")
                            .font(.system(size: descriptionFontSize, design: .rounded))
                            .multilineTextAlignment(.center).frame(width: 350)
                        Spacer()
                    }.padding(.bottom, 20)
                    VStack {
                        Spacer()
                        Image("TutOn8")
                            .resizable()
                            .aspectRatio(contentMode: .fit).frame(width: imageSize)
                        Spacer()
                        Text("Pemain yang dapat **menghabiskan kartu paling cepat** yang menjadi pemenangnya")
                            .font(.system(size: descriptionFontSize, design: .rounded))
                            .multilineTextAlignment(.center).frame(width: 350)
                        Spacer()
                    }.padding(.bottom, 20)
                }
                .foregroundColor(.black)
                .background(.white)
                .cornerRadius(20)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .padding(.top, 0)
                .onAppear {
                    UIPageControl.appearance().currentPageIndicatorTintColor = .black
                    UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
                }
            }.frame(width: 560, height: 300)
        }else if(tutortype == 2){
            VStack {
                Spacer()
                Text("CARA BERMAIN OFFLINE").font(.system(size: 24, weight: .heavy, design: .rounded))
                    .padding(.top, 20)
                TabView {
                    VStack {
                        Spacer()
                        Image("TutOff1")
                            .resizable()
                            .aspectRatio(contentMode: .fit).frame(width: imageSize)
                        Spacer()
                        Text("Kamu hanya memerlukan **1 handphone** ntuk memainkan mode offline").font(.system(size: descriptionFontSize, design: .rounded))
                            .multilineTextAlignment(.center).frame(width: 350)
                        Spacer()
                    }.padding(.bottom, 20)
                    VStack {
                        Spacer()
                        Image("TutOff2")
                            .resizable()
                            .aspectRatio(contentMode: .fit).frame(width: imageSize)
                        Spacer()
                        Text("Pilih **Mode Offline** dan **jumlah pemain** yang akan ikut bermain")
                            .font(.system(size: descriptionFontSize, design: .rounded))
                            .multilineTextAlignment(.center).frame(width: 350)
                        Spacer()
                    }.padding(.bottom, 20)
                    VStack {
                        Spacer()
                        Image("TutOff3")
                            .resizable()
                            .aspectRatio(contentMode: .fit).frame(width: imageSize)
                        Spacer()
                        Text("Pada awal permainan, setiap pemain akan diberikan **5 kartu** secara acak")
                            .font(.system(size: descriptionFontSize, design: .rounded))
                            .multilineTextAlignment(.center).frame(width: 350)
                        Spacer()
                    }.padding(.bottom, 20)
                    VStack {
                        Spacer()
                        Image("TutOff4")
                            .resizable()
                            .aspectRatio(contentMode: .fit).frame(width: imageSize)
                        Spacer()
                        Text("Pemain hanya dapat melihat layar handphone pada saat gilirannya")
                            .font(.system(size: descriptionFontSize, design: .rounded))
                            .multilineTextAlignment(.center).frame(width: 350)
                        Spacer()
                    }.padding(.bottom, 20)
                    VStack {
                        Spacer()
                        Image("TutOff5")
                            .resizable()
                            .aspectRatio(contentMode: .fit).frame(width: imageSize)
                        Spacer()
                        Text("Pada gilirannya, pemain harus mengeluarkan **1 kartu** sesuai dengan warna lingkaran yang terdapat pada bagian atas atau bawah kartu")
                            .font(.system(size: descriptionFontSize, design: .rounded))
                            .multilineTextAlignment(.center).frame(width: 350)
                        Spacer()
                    }.padding(.bottom, 20)
                    VStack {
                        Spacer()
                        Image("TutOff6")
                            .resizable()
                            .aspectRatio(contentMode: .fit).frame(width: imageSize)
                        Spacer()
                        Text("Setelah mengeluarkan kartu yang dipilih, kamu harus melakukan **tantangan** yang tertulis pada kartu tersebut sebelum bisa melanjutkan permainan")
                            .font(.system(size: descriptionFontSize, design: .rounded))
                            .multilineTextAlignment(.center).frame(width: 350)
                        Spacer()
                    }.padding(.bottom, 20)
                    VStack {
                        Spacer()
                        Image("TutOff7")
                            .resizable()
                            .aspectRatio(contentMode: .fit).frame(width: imageSize)
                        Spacer()
                        Text("Jika pemain tidak memiliki kartu dengan warna yang sesuai maka pemain harus mengambil kartu dari deck")
                            .font(.system(size: descriptionFontSize, design: .rounded))
                            .multilineTextAlignment(.center).frame(width: 350)
                        Spacer()
                    }.padding(.bottom, 20)
                    VStack {
                        Spacer()
                        Image("TutOff8")
                            .resizable()
                            .aspectRatio(contentMode: .fit).frame(width: imageSize)
                        Spacer()
                        Text("Setelah melakukan tantangan pemain dapat memberkan handphone kepada pemain selanjutnya")
                            .font(.system(size: descriptionFontSize, design: .rounded))
                            .multilineTextAlignment(.center).frame(width: 350)
                        Spacer()
                    }.padding(.bottom, 20)
                    VStack {
                        Spacer()
                        Image("TutOff9")
                            .resizable()
                            .aspectRatio(contentMode: .fit).frame(width: imageSize)
                        Spacer()
                        Text("Pemain yang dapat **menghabiskan kartu paling cepat** yang menjadi pemenangnya")
                            .font(.system(size: descriptionFontSize, design: .rounded))
                            .multilineTextAlignment(.center).frame(width: 350)
                        Spacer()
                    }.padding(.bottom, 20)
                }
                .foregroundColor(.black)
                .background(.white)
                .cornerRadius(20)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .padding(.top, 0)
                .onAppear {
                    UIPageControl.appearance().currentPageIndicatorTintColor = .black
                    UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
                }
            }.frame(width: 560, height: 300)
        }else if(tutortype == 3){
            VStack {
                Spacer()
                Text("ATURAN KARTU").font(.system(size: 24, weight: .heavy, design: .rounded))
                    .padding(.top, 20)
                TabView {
                    VStack {
                        Spacer()
                        Image("TutCard1")
                            .resizable()
                            .aspectRatio(contentMode: .fit).frame(width: imageSize)
                        Spacer()
                        Text("Terdapat **4 warna** kartu Family Secrets, yaitu: **Merah, Biru, Kuning,** dan **Ungu**").font(.system(size: descriptionFontSize, design: .rounded))
                            .multilineTextAlignment(.center).frame(width: 350)
                        Spacer()
                    }.padding(.bottom, 20)
                    VStack {
                        Spacer()
                        Image("TutCard2")
                            .resizable()
                            .aspectRatio(contentMode: .fit).frame(width: imageSize)
                        Spacer()
                        Text("Kartu **Merah** berisi **tantangan (dare)** yang harus dilakukan oleh **pemilik kartu** jika ia mau menggunakan kartu tersebut")
                            .font(.system(size: descriptionFontSize, design: .rounded))
                            .multilineTextAlignment(.center).frame(width: 350)
                        Spacer()
                    }.padding(.bottom, 20)
                    VStack {
                        Spacer()
                        Image("TutCard3")
                            .resizable()
                            .aspectRatio(contentMode: .fit).frame(width: imageSize)
                        Spacer()
                        Text("Kartu **Biru** berisi **pertanyaan** yang harus dijawab secara **jujur (Truth)** oleh **pemilik kartu** jika ia mau menggunakan kartu tersebut")
                            .font(.system(size: descriptionFontSize, design: .rounded))
                            .multilineTextAlignment(.center).frame(width: 350)
                        Spacer()
                    }.padding(.bottom, 20)
                    VStack {
                        Spacer()
                        Image("TutCard4")
                            .resizable()
                            .aspectRatio(contentMode: .fit).frame(width: imageSize)
                        Spacer()
                        Text("Kartu **Kuning** berisi **pertanyaan (Question)** yang  harus **pemilik kartu tanyakan** ke **pemain lain** jika ia mau menggunakan kartu tersebut")
                            .font(.system(size: descriptionFontSize, design: .rounded))
                            .multilineTextAlignment(.center).frame(width: 350)
                        Spacer()
                    }.padding(.bottom, 20)
                    VStack {
                        Spacer()
                        Image("TutCard5")
                            .resizable()
                            .aspectRatio(contentMode: .fit).frame(width: imageSize)
                        Spacer()
                        Text("Kartu **Ungu** merupakan kartu **spesial** yang dapat pemain gunakan **kapan pun**")
                            .font(.system(size: descriptionFontSize, design: .rounded))
                            .multilineTextAlignment(.center).frame(width: 350)
                        Spacer()
                    }.padding(.bottom, 20)
                    VStack {
                        Spacer()
                        Image("TutCard6")
                            .resizable()
                            .aspectRatio(contentMode: .fit).frame(width: imageSize)
                        Spacer()
                        Text("Terdapat **2 jenis** kartu **spesial**, yang pertama kartu **+**, dimana pemain selanjutnya akan mendapatkan **tambahan kartu** sesuai jumlah yang tertera")
                            .font(.system(size: descriptionFontSize, design: .rounded))
                            .multilineTextAlignment(.center).frame(width: 350)
                        Spacer()
                    }.padding(.bottom, 20)
                    VStack {
                        Spacer()
                        Image("TutCard7")
                            .resizable()
                            .aspectRatio(contentMode: .fit).frame(width: imageSize)
                        Spacer()
                        Text("**Kartu spesial kedua** memiliki **kemampuan memilih warna** dimana setelah mengeluarkan kartu ini, pemilik kartu dapat mengeluarkan kartu** dengan **warna apapun** yang dia inginkan ")
                            .font(.system(size: descriptionFontSize, design: .rounded))
                            .multilineTextAlignment(.center).frame(width: 350)
                        Spacer()
                    }.padding(.bottom, 20)
                }
                .foregroundColor(.black)
                .background(.white)
                .cornerRadius(20)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .padding(.top, 0)
                .onAppear {
                    UIPageControl.appearance().currentPageIndicatorTintColor = .black
                    UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
                }
            }.frame(width: 560, height: 300)
        }else{
            Text("")
        }
    }
}

struct TutorialMenuSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialMenuSelectionView(tutortype: .constant(1)).previewInterfaceOrientation(.landscapeRight)
    }
}
