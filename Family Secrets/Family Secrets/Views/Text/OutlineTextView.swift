//
//  OutlineTextView.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 05/05/23.
//

import SwiftUI

struct OutlineTextView: View {
    
    let text: String
    let shadowRadius: Double = 0.4
    let fontSize: Double
    
    var body: some View {
        Text(text)
            .font(.system(size: fontSize, weight: .heavy, design: .rounded))
            .foregroundColor(.white)
            .shadow(color: .black, radius: shadowRadius)
            .shadow(color: .black, radius: shadowRadius)
            .shadow(color: .black, radius: shadowRadius)
            .shadow(color: .black, radius: shadowRadius)
    }
}

//struct OutlineTextView_Previews: PreviewProvider {
//    static var previews: some View {
//        OutlineTextView()
//    }
//}
