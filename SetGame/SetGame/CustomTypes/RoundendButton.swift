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
    
    var body: some View {
        Button(action: action) {
            Group {
                Text(text)
                    .fontWeight(.semibold)
                    .padding(buttonPadding)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .cornerRadius(buttonCornerRadius)
            }
        }
    }
}

// MARK: - Constants

fileprivate let buttonPadding: CGFloat = 10
fileprivate let buttonCornerRadius: CGFloat = 10
