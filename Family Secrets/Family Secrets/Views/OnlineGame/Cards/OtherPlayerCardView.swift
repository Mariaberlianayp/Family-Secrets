//
//  OtherPlayerCardView.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 27/04/23.
//

import SwiftUI

struct OtherPlayerCardView: View {
    
    let width: Double = 60
    let height: Double = 90
    @State var card: GameCard
    @State var positionX: CGFloat
    @State var positionY: CGFloat
    
    var body: some View {
        Image("CardBack")
            .resizable()
            .frame(width: width, height: height)
            .position(x: positionX, y: positionY)
            .shadow(color: .black, radius: 1)
    }
}
