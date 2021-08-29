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
        // 120 -> Cards fill the screen in a better way
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(viewModel.cardsInTable) { card in
                CardView(state: card.state,
                         color: card.content.color,
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
    var state: SetGameCardState
    var color: SetGameTypes.CardColor
    var quantity: SetGameTypes.CardQuantity
    var fillPattern: SetGameTypes.CardFilling
    var shape: SetGameTypes.CardShape
    var cardView = SetGameCardBuilder()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                cardView.buildShape(shape: shape,
                                    color: color,
                                    quantity: quantity,
                                    fillPattern: fillPattern)
                    .cardify(isSelected: state.isSelected)
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
