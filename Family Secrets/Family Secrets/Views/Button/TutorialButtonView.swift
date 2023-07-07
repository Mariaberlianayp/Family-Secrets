//
//  TutorialButtonView.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 03/05/23.
//

import SwiftUI

struct TutorialButtonView: View {
    var body: some View {
        Image(systemName: "questionmark")
            .font(.system(size: 22))
            .background(
                Circle()
                    .fill(.black)
                    .frame(width: 50, height: 50)
                    .opacity(0.2)
            )
            .foregroundColor(.white)
    }
}

struct TutorialButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialButtonView()
    }
}
