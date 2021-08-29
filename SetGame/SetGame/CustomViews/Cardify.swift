//
//  Cardify.swift
//  SetGame
//
//  Created by Gabriel on 8/29/21.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isSelected: Bool
    
    var borderLineWidth: CGFloat {
        isSelected ? 6.0 : 3.0
    }
    
    var borderLineColor: Color {
        isSelected ? Color.green : Color.gray
    }
    
    func body(content: Content) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.white)
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
    func cardify(isSelected: Bool) -> some View {
        self.modifier(Cardify(isSelected: isSelected))
    }
}

