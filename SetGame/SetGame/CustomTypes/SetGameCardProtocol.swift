//
//  SetGameCardProtocol.swift
//  SetGame
//
//  Created by Gabriel on 8/28/21.
//

import SwiftUI

protocol SetGameCardProtocol: View {
    var color: SetGameTypes.CardColor { get set}
    var quantity: SetGameTypes.CardQuantity { get set}
    var fillPattern: SetGameTypes.CardFilling { get set}
    var shape: SetGameTypes.CardShape { get set}
}
