//
//  SetGame.swift
//  SetGame
//
//  Created by Gabriel on 8/27/21.
//

import Foundation

struct SetGame<SetGameCardContent> {
    private(set) var deckOfCards: Array<Card> = []
    private(set) var cardsInTable: Array<Card> = []
    private(set) var currentSelectedCards: Array<Card> = []
    
    init(createCardContent: (Int) -> SetGameCardContent) {
        cardsInTable = Array<Card>()
        // 81 = Size of a standard Set deck
        for cardIndex in 0 ..< 81 {
            let content = createCardContent(cardIndex)
            deckOfCards.append(Card(content: content,
                                    state: SetGameCardState(),
                                    id: cardIndex))
        }
        deckOfCards = deckOfCards.shuffled()
        getFirstTwelveCards()
    }
    
    private mutating func getFirstTwelveCards() {
        let firstTwelveCards = deckOfCards.prefix(12)
                
        for _ in 0 ..< firstTwelveCards.count {
            deckOfCards.removeFirst()
        }
        
        cardsInTable = Array(firstTwelveCards)
        for cardIndex in cardsInTable.indices {
            cardsInTable[cardIndex].state.wasSeen = true
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cardsInTable.firstIndex(where: { $0.id == card.id}) {
                        
            if !cardsInTable[chosenIndex].state.isSelected {
                cardsInTable[chosenIndex].state.isSelected = true
                currentSelectedCards.append(cardsInTable[chosenIndex])
            } else {
                cardsInTable[chosenIndex].state.isSelected = false
                currentSelectedCards.remove(
                    at: currentSelectedCards.firstIndex(
                        where: { $0.id == card.id })!)
            }
        }
        // TODO: Try to match cards when 3 cards were selected.
        // TODO: Add visual feedback when selected.
        print(currentSelectedCards)
    }
                                                                    
    struct Card: Identifiable {
        var content: SetGameCardContent
        var state: SetGameCardState
        var id: Int
    }
    
}
