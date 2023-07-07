//
//  TutorialSelectionButtonView.swift
//  Family Secrets
//
//  Created by Albert Silva on 04/05/23.
//

import SwiftUI

struct TutorialSelectionButtonView: View {
    let width: Double
    let height: Double
    let text: String
    let hover: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(hover ? LinearGradient(
                    gradient: .init(colors: [Color(red: 81 / 255, green: 83 / 255, blue: 151 / 255), Color(red: 65 / 255, green: 63 / 255, blue: 113 / 255)]),
                    startPoint: .init(x: 0.5, y: 0),
                    endPoint: .init(x: 0.5, y: 0.6)
                ) : LinearGradient(
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
                Text("\(text)")
                    .font(.system(size: 18, weight: .heavy, design: .rounded))
            }
            .foregroundColor(hover ? Color.white : Color("Text"))
        }
    }
}

struct TutorialSelectionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialSelectionButtonView(width: 200, height: 40, text: "SELANJUTNYA", hover: false).previewInterfaceOrientation(.landscapeRight)
    }
}
