//
//  SoundButtonView.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 03/05/23.
//

import SwiftUI

struct SoundButtonView: View {
    
    @State var image: String = "speaker.wave.1.fill"
    
    var body: some View {
        Image(systemName: "\(image)")
            .font(.system(size: 22))
            .background(
                Circle()
                    .fill(.black)
                    .frame(width: 50, height: 50)
                    .opacity(0.2)
            )
            .foregroundColor(.white)
            .onTapGesture {
                
                if image == "speaker.slash.fill" {
                image = "speaker.wave.1.fill"
                } else {
                    image = "speaker.slash.fill"
                }
            }
    }
}

struct SoundButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SoundButtonView()
    }
}
