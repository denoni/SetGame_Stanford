//
//  SetGameCardTypes.swift
//  SetGame
//
//  Created by Gabriel on 8/28/21.
//

import SwiftUI

struct SetGameTypes {
    
    enum CardFilling: CaseIterable {
        case filled, empty, striped
    }
    
    enum CardQuantity: CaseIterable {
        case one, two, three
    }
    
    enum CardColor: CaseIterable {
        case green, red, blue
    }
    
    enum CardShape: CaseIterable {
        case diamond, capsule, circle
    }
    
    static func setColor(_ color: SetGameTypes.CardColor) -> Color {
        switch color {
        case .green:
            return Color.green
        case .red:
            return Color.red
        case .blue:
            return Color.blue
        }
    }
    
    static func setQuantity(_ quantity: SetGameTypes.CardQuantity) -> Int {
        switch quantity {
        case .one:
            return 1
        case .two:
            return 2
        case .three:
            return 3
        }
    }
    
}

