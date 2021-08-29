//
//  SetGame.swift
//  SetGame
//
//  Created by Gabriel on 8/27/21.
//

import Foundation

struct SetGame<SetGameContent> {
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
            
            for cardIndex in cardsInTable.indices {
                cardsInTable[cardIndex].state.isWronglySelected = false
            }

            if !cardsInTable[chosenIndex].state.isSelected {
                cardsInTable[chosenIndex].state.isSelected = true
                currentSelectedCards.append(cardsInTable[chosenIndex])
                
                if currentSelectedCards.count == 3 { tryToMatch() }
                
            } else {
                cardsInTable[chosenIndex].state.isSelected = false
                currentSelectedCards.remove(
                    at: currentSelectedCards.firstIndex(
                        where: { $0.id == card.id })!)
            }
        }
    }
    
    mutating func tryToMatch() {
        
        var noMatchSituation = false
        
        func noMatch() {
            
            print("NO MATCH!")
            
            noMatchSituation = true
            
            for cardIndex in currentSelectedCards.indices {
                if let foundIndex = cardsInTable.firstIndex(
                    where: { $0.id == currentSelectedCards[cardIndex].id }) {
                    
                    cardsInTable[foundIndex].state.isSelected = false
                    cardsInTable[foundIndex].state.isWronglySelected = true
                }
            }
            currentSelectedCards.removeAll()
        }
        
        func match() {
            
            print("MATCH!")
            
            for cardIndex in currentSelectedCards.indices {
                if let foundIndex = cardsInTable.firstIndex(
                    where: { $0.id == currentSelectedCards[cardIndex].id }) {
                    
                    cardsInTable[foundIndex].state.isMatched = true
                    cardsInTable.remove(at: foundIndex)
            
                    if deckOfCards.count != 0 {
                        if cardsInTable.count < 12 {
                            cardsInTable.append(deckOfCards.removeFirst())
                        }
                    } else {
                        print("Deck is empty")
                    }
                }
            }
            currentSelectedCards.removeAll()
        }
        
        var cards: [SetGameCardContent] = []
        
        for cardIndex in currentSelectedCards.indices {
            let card = SetGameCardContent.getDataFrom(currentSelectedCards[cardIndex].content)
            cards.append(card)
        }
        
        var cardColors: [SetGameTypes.CardColor: Int] = [:]
        var cardShapes: [SetGameTypes.CardShape: Int] = [:]
        var cardQuantities: [SetGameTypes.CardQuantity: Int] = [:]
        var cardFillings: [SetGameTypes.CardFilling: Int] = [:]
        
        cardContentLoop: for cardIndex in cards.indices {
            
            let card = cards[cardIndex]
            
            cardColors[card.color, default: 0] += 1
            cardShapes[card.shape, default: 0] += 1
            cardQuantities[card.quantity, default: 0] += 1
            cardFillings[card.filling, default: 0] += 1
            
        }
        
            // This for loop is just to enable `break` from all
            // loops below when a violation to a match is found
        testForMatches: for _ in 0...1 {
            
            for repetitionCount in cardColors.values {
                guard repetitionCount != 2 else {
                    noMatch()
                    break testForMatches
                }
            }
            for repetitionCount in cardShapes.values {
                guard repetitionCount != 2 else {
                    noMatch()
                    break testForMatches
                }
            }
            for repetitionCount in cardQuantities.values {
                guard repetitionCount != 2 else {
                    noMatch()
                    break testForMatches
                }
            }
            for repetitionCount in cardFillings.values {
                guard repetitionCount != 2 else {
                    noMatch()
                    break testForMatches
                }
            }
        }
        if noMatchSituation == false {
            match()
        }
    }
                                                                    
    struct Card: Identifiable {
        var content: SetGameCardContent
        var state: SetGameCardState
        var id: Int
    }
    
}
