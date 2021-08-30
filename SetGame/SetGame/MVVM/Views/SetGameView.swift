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
                               action: { viewModel.startNewGame(cardsInTable: viewModel.cardsInTable)
                               })
            AspectVGrid(items: viewModel.cardsInTable,
                        aspectRatio: cardAspectRatio,
                        content: { card in
                            CardView(state: card.state,
                                     color: card.content.color,
                                     quantity: card.content.quantity,
                                     fillPattern: card.content.filling,
                                     shape: card.content.shape)
                                .padding(cardPadding)
                                .onTapGesture {
                                viewModel.choose(card)
                                }
                        })
            RoundedButton.init(text: grabMoreCardsButtonText,
                               action: viewModel.grabThreeNewCards,
                               disabled: viewModel.grabMoreCardsButtonIsDisabled)
        }.padding(.horizontal, viewHorizontalPadding)
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
fileprivate let cardPadding: CGFloat = 5
fileprivate let viewHorizontalPadding: CGFloat = 30
fileprivate let newGameButtonText: String = "New Game!"
fileprivate let grabMoreCardsButtonText: String = "Grab 3 more cards"



// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let setGame = SetGameViewModel()
        ContentView(viewModel: setGame)
    }
}
