//
//  ContentView.swift
//  First
//
//  Created by Shady Adel on 16/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    let emojisCars = ["🚗","🚕","🚙","🚌","🚎","🏎️","🚓","🚑","🚜","🚗","🚕","🚙","🚌","🚎","🏎️","🚓","🚑","🚜"]
    let emojisHallowen = ["👻","😈","👹","💀","👽","👾","🤖","🎃","👀","👻","😈","👹","💀","👽","👾","🤖","🎃","👀"]
    @State var emojis = ["👻","😈","👹","💀","👽","👾","🤖","🎃","👀","👻","😈","👹","💀","👽","👾","🤖","🎃","👀"]
    @State var cardCount = 18
    
    var body: some View {
        
        VStack{
            Text("Memorize").font(.largeTitle).bold()
            Spacer().frame(height: 50)
            if cardCount > 0 && emojis.count > 0 {
                ScrollView{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))],spacing: 10)
                    {
                        ForEach(0..<cardCount, id: \.self ){ index in
                            CardView(content: emojis[index])
                                .frame(width: 65,height: 75,alignment: .center)
                        }
                    }
                }
            }
            else {
                Text("Choose A Theme and add Cards")
            }
            Spacer()
            HStack{
                AddCard
                Spacer()
                HalloweenTheme
                CarsTheme
                Spacer()
                RemoveCard
            }
        }.padding().font(.largeTitle)
    }
    
    var AddCard : some View {
        Button {
            if cardCount < emojis.count {cardCount += 1}
        } label: {
            Image(systemName: "plus.square")
        }
    }
    
    var RemoveCard : some View {
        Button {
            if cardCount > -1 {cardCount -= 1}
        } label: {
            Image(systemName: "minus.square")
        }
    }
    
    var HalloweenTheme : some View {
        Button {
            emojis = emojisHallowen
            emojis.shuffle()
        } label: {
            VStack{
                Image(systemName: "theatermasks.circle")
                Text("Hallowen").font(.caption2)
            }
        }
    }
    var CarsTheme: some View {
        Button {
            emojis = emojisCars
            emojis.shuffle()
        } label: {
            VStack{
                Image(systemName: "car.circle")
                Text("Cars").font(.caption)
            }
        }
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = false
    var content: String
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)
        ZStack{
            if isFaceUp {
                base.strokeBorder(lineWidth: 2)
                Text(content).imageScale(.large)
            }
            else {
                base.fill()
            }
        }
        .foregroundColor(.orange)
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
