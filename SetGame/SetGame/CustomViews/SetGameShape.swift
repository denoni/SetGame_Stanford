//
//  SetGameShape.swift
//  SetGame
//
//  Created by Gabriel on 8/28/21.
//

import SwiftUI

struct SetGameShape: SetGameCardProtocol {
    var color: SetGameTypes.CardColor
    var quantity: SetGameTypes.CardQuantity
    var fillPattern: SetGameTypes.CardFilling
    var shape: SetGameTypes.CardShape
                
    init(shape: SetGameTypes.CardShape,
         color: SetGameTypes.CardColor,
         quantity: SetGameTypes.CardQuantity,
         fillPattern: SetGameTypes.CardFilling) {
            self.color = color
            self.quantity = quantity
            self.fillPattern = fillPattern
            self.shape = shape
    }
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                chooseShape(shape)
                Spacer()
            }.padding()
            Spacer()
        }
    }
    
    private func chooseShape(_ shape: SetGameTypes.CardShape) -> some View {
        Group {
            switch shape {
            case .diamond:
                ForEach( 0 ..< SetGameTypes.setQuantity(quantity) ) { _ in
                    Diamond().filledWithPattern(fillPattern, withColor: SetGameTypes.setColor(color)) }
            case .capsule:
                ForEach( 0 ..< SetGameTypes.setQuantity(quantity) ) { _ in
                    Capsule().filledWithPattern(fillPattern, withColor: SetGameTypes.setColor(color)) }
            case .circle:
                ForEach( 0 ..< SetGameTypes.setQuantity(quantity) ) { _ in
                    Circle().filledWithPattern(fillPattern, withColor: SetGameTypes.setColor(color)) }
            }
        }
    }
    
}
