//
//  SetGameView.swift
//  SetGame
//
//  Created by Gabriel on 8/27/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: SetGameViewModel
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            ForEach(viewModel.cards) { card in
                CardView(color: card.content.color,
                         quantity: card.content.quantity,
                         fillPattern: card.content.filling,
                         shape: card.content.shape)
                    .aspectRatio(2/3, contentMode: .fit)
                    .onTapGesture {
                    viewModel.choose(card)
                    }
            }
        }.padding()
        .foregroundColor(.red)
    }
}

struct CardView: View {
    var color: SetGameTypes.CardColor
    var quantity: SetGameTypes.CardQuantity
    var fillPattern: SetGameTypes.CardFilling
    var shape: SetGameTypes.CardShape
    var cardView = SetGameCardBuilder()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill()
                        .foregroundColor(.white)
                    RoundedRectangle(cornerRadius: 25)
                        .strokeBorder(lineWidth: 4)
                cardView.buildShape(shape: shape,
                                    color: color,
                                    quantity: quantity,
                                    fillPattern: fillPattern)
            }
            
        }
    }
}



// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let setGame = SetGameViewModel()
        ContentView(viewModel: setGame)
    }
}
