//
//  ColoredTextView.swift
//  FS-Offline
//
//  Created by Maria Berliana on 06/05/23.
//

import SwiftUI

struct ColoredTextView: View {
    let text: String
    let colors: [Color]

    init(_ text: String, colors: [Color]) {
        self.text = text
        self.colors = colors
    }

    var body: some View {
        HStack(spacing: 0) {
            ForEach(Array(text.enumerated()), id: \.offset) { index, char in
                Text(String(char))
                    .foregroundColor(colors[index % colors.count])
                    .shadow(color: .black, radius: 5)
            }
        }
    }
}

