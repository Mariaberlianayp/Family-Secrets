//
//  ButtonView.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 03/05/23.
//

import SwiftUI

struct ButtonView: View {
    
    let width: Double
    let height: Double
    let text: String
    let fontSize: Double
    
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
            
            Text("\(text)")
                .font(.system(size: fontSize, weight: .heavy, design: .rounded))
                .foregroundColor(Color("Text"))
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(width: 200, height: 70, text: "Simpan", fontSize: 22)
            .previewInterfaceOrientation(.landscapeRight)
    }
}
