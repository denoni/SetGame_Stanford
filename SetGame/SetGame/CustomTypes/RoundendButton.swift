//
//  RoundendButton.swift
//  SetGame
//
//  Created by Gabriel on 8/29/21.
//

import SwiftUI

struct RoundedButton: View {
    var text: String
    var action: () -> Void
    var disabled = false
    var backgroundColor = Color.darkSensitive.black
    var foregoundColor = Color.darkSensitive.white
    
    var body: some View {
        Button(action: action) {
            Group {
                Text(text)
                    .fontWeight(.semibold)
                    .padding(buttonPadding)
                    .foregroundColor(foregoundColor)
                    .background(backgroundColor)
                    .cornerRadius(buttonCornerRadius)
                    .opacity(disabled ? 0.3 : 1)
            }
        }.disabled(disabled)
    }
}

// MARK: - Constants

fileprivate let buttonPadding: CGFloat = 10
fileprivate let buttonCornerRadius: CGFloat = 10
