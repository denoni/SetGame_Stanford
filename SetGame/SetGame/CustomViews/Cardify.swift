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

fileprivate let cornerRadius: CGFloat = 25.0
fileprivate let cardBackgroundColor = Color.white

fileprivate let selectedBorderLineWidth: CGFloat = 6.0
fileprivate let selectedBorderColor = Color.green

fileprivate let unselectedBorderLineWidth: CGFloat = 3.0
fileprivate let unselectedBorderColor = Color.gray

fileprivate let wronglySelectedBorderColor = Color.red
fileprivate let wronglySelectedBackgroundColor = Color.red.opacity(0.2)



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
