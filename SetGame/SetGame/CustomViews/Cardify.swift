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
        isSelected || isWronglySelected ? 6.0 : 3.0
    }
    
    var borderLineColor: Color {
        var borderColor = isSelected ? Color.green : Color.gray
        if isWronglySelected { borderColor = Color.red }
        return borderColor
    }
    
    func body(content: Content) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.white)
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.red.opacity(0.2))
                .opacity(isWronglySelected ? 1 : 0)
            RoundedRectangle(cornerRadius: 25.0)
                .stroke(lineWidth: borderLineWidth)
                .foregroundColor(borderLineColor)
            content
        }
        .transition(AnyTransition.slide)
    }
}



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
