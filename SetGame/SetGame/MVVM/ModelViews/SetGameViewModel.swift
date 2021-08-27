//
//  SetGameViewModel.swift
//  SetGame
//
//  Created by Gabriel on 8/27/21.
//

import SwiftUI

class SetGameViewModel: ObservableObject {
    @Published private var setGameModel: SetGame<String> = createSetGame()
    
    static let testShapes = ["△", "▨", "▮", "◌", "◊"]
    
    private static func createSetGame() -> SetGame<String> {
        SetGame<String>(numberOfCards: 5) { cardIndex in
            SetGameViewModel.testShapes[cardIndex]
        }
    }
    
    
    
    // MARK: - Access to the Model
    
    var cards: Array<SetGame<String>.Card> {
        setGameModel.cards
    }
    
    
    
    // MARK: - Intents
    
    func choose(_ card: SetGame<String>.Card) {
        setGameModel.choose(card)
    }
}
