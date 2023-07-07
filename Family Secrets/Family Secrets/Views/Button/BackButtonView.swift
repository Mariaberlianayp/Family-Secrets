//
//  BackButtonView.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 03/05/23.
//

import SwiftUI

struct BackButtonView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .background(.black)
                .frame(width: 120, height: 40)
                .cornerRadius(100)
                .opacity(0.2)
            
            HStack {
                Image(systemName: "arrowtriangle.backward.fill")
                    .font(.system(size: 16))
                
                Text("Kembali")
                    .font(.system(size: 16, weight: .heavy, design: .rounded))
            }
            .foregroundColor(.white)
        }
        .foregroundColor(.black)
    }
}

struct BackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
