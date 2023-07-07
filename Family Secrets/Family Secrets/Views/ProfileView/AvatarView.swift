//
//  AvatarView.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 25/04/23.
//

import SwiftUI

struct AvatarView: View {
    
    @Binding var showPopover: Bool
    @Binding var selectedAvatar: String
    
    var body: some View {
        
        VStack {
            HStack(spacing: 0) {
                ForEach(0..<4) {i in
                    AvatarSelectionView(imageName: "profile_\(i)", selectedAvatar: $selectedAvatar)
                }
            }
            
            Button("Close") {
                showPopover = false
            }
        }
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(showPopover: .constant(true), selectedAvatar: .constant("none"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
