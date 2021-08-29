//
//  SetGameViewModel.swift
//  SetGame
//
//  Created by Gabriel on 8/27/21.
//

import SwiftUI

class SetGameViewModel: ObservableObject {
    @Published private var setGameModel: SetGame<AnyView> = createSetGame()
    
    static let testShapes = [AnyView(Diamond()), AnyView(Capsule()), AnyView(Circle())]
    
    private static func createSetGame() -> SetGame<AnyView> {
        SetGame<AnyView>() { cardIndex in
            SetGameViewModel.testShapes[cardIndex]
        }
    }
    
    
    
    // MARK: - Access to the Model
    
    var cards: Array<SetGame<AnyView>.Card> {
        setGameModel.cards
    }
    
    
    
    // MARK: - Intents
    
    func choose(_ card: SetGame<AnyView>.Card) {
        setGameModel.choose(card)
    }
}
