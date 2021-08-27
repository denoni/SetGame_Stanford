//
//  SetGame.swift
//  SetGame
//
//  Created by Gabriel on 8/27/21.
//

import Foundation

struct SetGame<SetGameCardContent> {
    private(set) var cards: Array<Card>
    
    func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}) {
            print("Chosen card: \(cards[chosenIndex])")
        }
    }
    
    init(numberOfCards: Int,
         createCardContent: (Int) -> SetGameCardContent) {
        cards = Array<Card>()
        for cardIndex in 0..<numberOfCards {
            let content = createCardContent(cardIndex)
            cards.append(Card(content: content, id: cardIndex))
        }
    }
    
    struct Card: Identifiable {
        var content: SetGameCardContent
        var id: Int
    }
    
}
