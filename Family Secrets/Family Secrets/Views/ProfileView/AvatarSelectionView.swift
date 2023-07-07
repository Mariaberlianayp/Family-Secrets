//
//  AvatarButtonView.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 25/04/23.
//

import SwiftUI

struct AvatarSelectionView: View {
    
    let imageName: String
    let imageSize: Double = 100
    @State var borderWidth: Double = 0
    @Binding var selectedAvatar: String
    
    var body: some View {
        Image("\(imageName)")
            .resizable()
            .frame(width: imageSize, height: imageSize)
            .border(.black, width: selectedAvatar == imageName ? 2 : 0)
            .onTapGesture {
                selectedAvatar = imageName
            }
    }
    
}

struct AvatarSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarSelectionView(imageName: "avatar1", selectedAvatar: .constant("avatar1"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
