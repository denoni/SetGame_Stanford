//
//  Cardify.swift
//  SetGame
//
//  Created by Gabriel on 8/29/21.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isSelected: Bool
    var isWronglySelected: Bool
    
    var borderLineWidth: CGFloat {
        isSelected || isWronglySelected ? selectedBorderLineWidth : unselectedBorderLineWidth
    }
    
    var borderLineColor: Color {
        var borderColor = isSelected ? selectedBorderColor : unselectedBorderColor
        if isWronglySelected { borderColor = wronglySelectedBorderColor }
        return borderColor
    }
    
    func body(content: Content) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(cardBackgroundColor)
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(wronglySelectedBackgroundColor)
                .opacity(isWronglySelected ? 1 : 0)
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(lineWidth: borderLineWidth)
                .foregroundColor(borderLineColor)
            content
        }
        .transition(AnyTransition.slide)
    }
}



// MARK: - Constants

let cornerRadius: CGFloat = 25.0
let cardBackgroundColor = Color.white

let selectedBorderLineWidth: CGFloat = 6.0
let selectedBorderColor = Color.green

let unselectedBorderLineWidth: CGFloat = 3.0
let unselectedBorderColor = Color.gray

let wronglySelectedBorderColor = Color.red
let wronglySelectedBackgroundColor = Color.red.opacity(0.2)



// MARK: - Cardify Extension

extension View {
    func cardify(
        isSelected: Bool,
        isWronglySelected: Bool)
        -> some View {
            self.modifier(
                Cardify(isSelected: isSelected,
                        isWronglySelected: isWronglySelected)
            )
        }
}
