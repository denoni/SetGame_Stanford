//
//  SetGameCardBuilder.swift
//  SetGame
//
//  Created by Gabriel on 8/28/21.
//

import SwiftUI

struct SetGameCardBuilder {
    @ViewBuilder
    func buildShape(shape: SetGameTypes.CardShape,
                    color: SetGameTypes.CardColor,
                    quantity: SetGameTypes.CardQuantity,
                    fillPattern: SetGameTypes.CardFilling)
    -> some View { SetGameShape.init(shape: shape,
                                     color: color,
                                     quantity: quantity,
                                     fillPattern: fillPattern)
    }
}
