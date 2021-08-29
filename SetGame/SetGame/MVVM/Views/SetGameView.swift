//
//  SetGameView.swift
//  SetGame
//
//  Created by Gabriel on 8/27/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: SetGameViewModel
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            ForEach(viewModel.cards) { card in
                CardView(card: card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .onTapGesture {
                    viewModel.choose(card)
                    }
            }
        }.padding()
        .foregroundColor(.red)
    }
}

struct CardView: View {
    var card: SetGame<AnyView>.Card
    
    var body: some View {
        ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill()
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 25)
                    .strokeBorder(lineWidth: 4)
                card.content
                    .padding()
        }
    }
}



// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let setGame = SetGameViewModel()
        ContentView(viewModel: setGame)
    }
}
