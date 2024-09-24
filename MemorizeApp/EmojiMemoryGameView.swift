//
//  ContentView.swift
//  MemorizeApp
//
//  Created by Никита Бондарь on 19.09.2024.
//

import SwiftUI
import Foundation

struct EmojiMemoryGameView: View {
    
    var gameMemory: MemoryGameViewModel
    
    let sportTheme = ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐"]
    let carTheme = ["🚗", "🚙", "🚕", "🚓", "🏎️", "🚑"]
    let foodTheme = ["🍕", "🍔", "🍟", "🌭", "🍿", "🍣"]
    
    @State var arrTheme: [String] = []
    
    var body: some View {
        VStack(){
            Text("Memorize!")
                .font(.largeTitle)
            if arrTheme.count != 0{
                LazyVGrid(columns:  [GridItem(.adaptive(minimum: 70))]){
                    ForEach(arrTheme.indices, id: \.self){ index in
                        CardView(emoji: arrTheme[index])
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .padding()
            }
            Spacer()
            HStack(spacing: 20){
                vehilesThemeButton
                Spacer()
                foodThemeButton
                Spacer()
                halloweenThemeButton
            }
            .padding(.horizontal, 20)
        }
        .padding()
    }
    
    func changeThemeButton(symbol: String, arr: [String], labelText: String) -> some View {
        let pairsCount: Int = Int.random(in: 4...arr.count)
        return Button {
                arrTheme = Array(arr.prefix(pairsCount))
                arrTheme += arrTheme
                arrTheme.shuffle()
            } label: {
                VStack {
                    Image(systemName: symbol)
                        .font(.largeTitle)
                    Text(labelText)
                        .font(.caption)
                }
            }
        }
    
    var vehilesThemeButton: some View{
        changeThemeButton(symbol: "car", arr: carTheme, labelText: "Vehicles")
    }
    
    var foodThemeButton: some View{
        changeThemeButton(symbol: "carrot.fill", arr: foodTheme, labelText: "Foods")
    }
    
    var halloweenThemeButton: some View{
        changeThemeButton(symbol: "soccerball", arr: sportTheme, labelText: "Sport")
    }
}

struct CardView : View {
    
    @State var isFaceUp : Bool = false
    let emoji: String
    var body: some View{
        ZStack {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            if isFaceUp{
                base.fill(.white)
                base
                    .strokeBorder(lineWidth: 2)
                    .foregroundStyle(.cyan)
                Text(emoji)
                    .font(.largeTitle)
            }
            base.fill(.cyan)
                .opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture{
            isFaceUp.toggle()
        }
    }
}



#Preview {
    EmojiMemoryGameView()
}
