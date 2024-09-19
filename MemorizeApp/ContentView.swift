//
//  ContentView.swift
//  MemorizeApp
//
//  Created by Никита Бондарь on 19.09.2024.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        HStack{
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .padding()
    }
}



struct CardView : View {
    
    var isFaceUp : Bool = false
    
    var body: some View{
        ZStack {
            if isFaceUp{
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                    .foregroundStyle(.cyan)
                Text("🦅")
                    .font(.largeTitle)

            } else{
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.cyan)
            }
                    }
    }
}

#Preview {
    ContentView()
}
