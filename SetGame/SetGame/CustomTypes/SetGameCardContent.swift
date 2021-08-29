//
//  SetGameCardContent.swift
//  SetGame
//
//  Created by Gabriel on 8/28/21.
//

import SwiftUI

struct SetGameCardContent: Equatable {
    var color: SetGameTypes.CardColor
    var shape: SetGameTypes.CardShape
    var quantity: SetGameTypes.CardQuantity
    let filling: SetGameTypes.CardFilling
    
    init(color: SetGameTypes.CardColor, shape: SetGameTypes.CardShape,
         quantity: SetGameTypes.CardQuantity, filling: SetGameTypes.CardFilling) {
        self.color = color
        self.shape = shape
        self.quantity = quantity
        self.filling = filling
    }
    
    static func getDataFrom(_ setGameCardContent: SetGameCardContent) -> SetGameCardContent {
        setGameCardContent
    }
}
