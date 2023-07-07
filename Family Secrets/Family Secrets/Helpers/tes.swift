import SwiftUI

struct RainbowText: View {
    let text = "Rainbow"
    let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple]
    
    var body: some View {
        Text("\(getNthIndex())")
    }
    
    func getNthIndex() {
        return text.index(0, offsetBy: 1)
    }
}
