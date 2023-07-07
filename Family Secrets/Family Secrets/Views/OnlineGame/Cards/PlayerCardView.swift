//
//  GameView.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 27/04/23.
//

import SwiftUI

struct PlayerCardView: View {
    
    @State var width: Double = 100
    @State var height: Double = 140
    @State var positionX: CGFloat
    @State var positionY: CGFloat
    @Binding var filename: String
    
    var body: some View {
        Image("\(filename)")
            .resizable()
            .frame(width: width, height: height)
            .position(x: positionX, y: positionY)
    }
}
