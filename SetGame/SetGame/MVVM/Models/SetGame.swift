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
    
    func choose(_ card: Card) {
        if let chosenIndex = cardsInTable.firstIndex(where: { $0.id == card.id}) {
            print("Chosen card: \(cardsInTable[chosenIndex])")
        }
    }
    
    init(createCardContent: (Int) -> SetGameCardContent) {
        cardsInTable = Array<Card>()
        // 81 = Size of a standard Set deck
        for cardIndex in 0 ..< 81 {
            let content = createCardContent(cardIndex)
            deckOfCards.append(Card(content: content, id: cardIndex))
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
        
        // TODO: 12 Cards were shown, add card state changes
    }
    
    struct Card: Identifiable {
        var content: SetGameCardContent
        var id: Int
    }
    
}
