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
        VStack {
            RoundedButton.init(text: newGameButtonText,
                               action: { viewModel
                                    .startNewGame(cardsInTable: viewModel.cardsInTable)
                               })
            LazyVGrid(columns: [GridItem(.adaptive(minimum: minimumGridItemSize))]) {
                ForEach(viewModel.cardsInTable) { card in
                    CardView(state: card.state,
                             color: card.content.color,
                             quantity: card.content.quantity,
                             fillPattern: card.content.filling,
                             shape: card.content.shape)
                        .aspectRatio(cardAspectRatio, contentMode: .fit)
                        .onTapGesture {
                        viewModel.choose(card)
                        }
                }
            }
            RoundedButton.init(text: grabMoreCardsButtonText,
                               action: viewModel.grabThreeNewCards)
        }.padding()
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
                    .cardify(isSelected: state.isSelected,
                             isWronglySelected: state.isWronglySelected)
            }
            
        }
    }
}



// MARK: - Constants

fileprivate let minimumGridItemSize: CGFloat = 120
fileprivate let cardAspectRatio: CGFloat = 5/6
fileprivate let newGameButtonText: String = "New Game!"
fileprivate let grabMoreCardsButtonText: String = "Grab 3 more cards"



// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let setGame = SetGameViewModel()
        ContentView(viewModel: setGame)
    }
}
