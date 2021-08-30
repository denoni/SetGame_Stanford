//
//  SetGameViewModel.swift
//  SetGame
//
//  Created by Gabriel on 8/27/21.
//

import SwiftUI

class SetGameViewModel: ObservableObject {
    @Published private var setGameModel: SetGame<SetGameCardContent> = createSetGame()
        
    private static func createSetGame() -> SetGame<SetGameCardContent> {
        
        var arrayOfPosibilities: Array<SetGameCardContent> = []
        
        for shape in SetGameTypes.CardShape.allCases {
            for color in SetGameTypes.CardColor.allCases {
                for quantity in SetGameTypes.CardQuantity.allCases {
                    for filling in SetGameTypes.CardFilling.allCases {
                        arrayOfPosibilities.append(
                            SetGameCardContent.init(
                                color: color,
                                shape: shape,
                                quantity: quantity,
                                filling: filling)
                        )
                    }
                }
            }
        }
        return SetGame<SetGameCardContent>() {
            cardIndex in return arrayOfPosibilities[cardIndex]
        }
    }
    
    
    
    // MARK: - Access to the Model
    
    var cardsInTable: Array<SetGame<SetGameCardContent>.Card> {
        setGameModel.cardsInTable
    }
    
    
    
    // MARK: - Intents
    
    func choose(_ card: SetGame<SetGameCardContent>.Card) {
        setGameModel.choose(card)
    }
    
    func startNewGame(cardsInTable: Array<SetGame<SetGameCardContent>.Card>) {
        setGameModel = SetGameViewModel.createSetGame()
    }

    func grabThreeNewCards() {
        setGameModel.grabThreeNewCards()
    }
    
}
