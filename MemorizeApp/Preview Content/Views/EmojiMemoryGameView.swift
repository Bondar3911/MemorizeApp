//
//  EmojiMemoryGameView.swift
//  MemorizeApp
//
//  Created by Никита Бондарь on 19.09.2024.
//

import SwiftUI
import Foundation

struct EmojiMemoryGameView: View {
    
    var gameMemory: MemoryGameViewModel = MemoryGameViewModel()
    
    
    var body: some View {
        VStack(){
            LazyVGrid(columns:  [GridItem(.adaptive(minimum: 90), spacing: 0)], spacing: 0){
                    ForEach(gameMemory.cards.indices, id: \.self){ index in
                        CardView(gameMemory.cards[index])
                            .aspectRatio(2/3, contentMode: .fit)
                            .padding(2)
                    }
                }
            Button("Shuffle"){
                gameMemory.shuffle()
            }
        }
        .padding()
    }
        
    
}

struct CardView : View {

    let card : MemorizeGame<String>.Card
    
    init(_ card: MemorizeGame<String>.Card) {
        self.card = card
    }
    
    var body: some View{
        ZStack {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            if card.isFaceUp{
                base.fill(.white)
                base
                    .strokeBorder(lineWidth: 2)
                    .foregroundStyle(.cyan)
                Text(card.content)
                    .font(.system(size: 150))
                    .minimumScaleFactor (0.01)
                    .aspectRatio(contentMode: .fit)
            }
            base.fill(.cyan)
                .opacity(card.isFaceUp ? 0 : 1)
        }    }
}



#Preview {
    EmojiMemoryGameView()
}
