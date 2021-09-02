//
//  Color+DarkSensitive.swift
//  SetGame
//
//  Created by Gabriel on 9/2/21.
//

import SwiftUI

extension Color {
    static let darkSensitive = DarkSensitive()
}

struct DarkSensitive {
    let white = Color("WhiteDarkSensitiveColor")
    let black = Color("BlackDarkSensitiveColor")
}
