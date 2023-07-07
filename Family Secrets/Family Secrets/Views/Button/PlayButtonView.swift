//
//  PlayButtonView.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 03/05/23.
//

import SwiftUI

struct PlayButtonView: View {
    
    let width: Double
    let height: Double
    let text: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(
                    gradient: .init(colors: [Color(red: 255 / 255, green: 249 / 255, blue: 128 / 255), Color(red: 255 / 255, green: 211 / 255, blue: 77 / 255)]),
                    startPoint: .init(x: 0.5, y: 0),
                    endPoint: .init(x: 0.5, y: 0.6)
                ))
                .frame(width: width, height: height)
                .cornerRadius(100)
                .overlay(RoundedRectangle(cornerRadius: 100)
                    .stroke(Color.black, lineWidth: 2)
                )
            
            HStack {
                Image(systemName: "play.fill")
                    .font(.system(size: 18, weight: .heavy, design: .rounded))
                
                Text("\(text)")
                    .font(.system(size: 18, weight: .heavy, design: .rounded))
            }
            .foregroundColor(Color("Text"))
        }
    }
}

struct PlayButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PlayButtonView(width: 200, height: 40, text: "SELANJUTNYA")
            .previewInterfaceOrientation(.landscapeRight)
    }
}
