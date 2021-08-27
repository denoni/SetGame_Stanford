//
//  SetGameApp.swift
//  SetGame
//
//  Created by Gabriel on 8/27/21.
//

import SwiftUI

@main
struct SetGameApp: App {
    let setGame = SetGameViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: setGame)
        }
    }
}
