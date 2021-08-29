//
//  Shape+Fillment.swift
//  SetGame
//
//  Created by Gabriel on 8/28/21.
//

import SwiftUI


private func shapeSize(for size: CGSize) -> CGFloat {
    min(size.width, size.height)
}

extension View where Self: InsettableShape {
    @ViewBuilder
    func filledWithPattern(_ pattern: SetGameTypes.CardFilling, withColor color: Color) -> some View {
        if pattern == .filled {
            self.fill(color)
                .aspectRatio(7/3, contentMode: .fit)
        } else if pattern == .empty {
            self.strokeBorder(lineWidth: 2.0).foregroundColor(color)
                .aspectRatio(7/3, contentMode: .fit)
        } else if pattern == .striped {
            self.strokeBorder(lineWidth: 2.0).foregroundColor(color)
                .background(self.fill(color).opacity(0.25))
                .aspectRatio(7/3, contentMode: .fit)
        }
    }
}
