//
//  SetGameView.swift
//  Set
//
//  Created by Treata Norouzi on 4/17/23.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var game: TraditionalSetGame
    
    var body: some View {
        AspectVGrid(items: game.cards, aspectRatio: 5/8, content: RoundedRectangle(cornerRadius: 5.0))
    }
}

struct CardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius).fill(Color.white)
//            Text(game.cards)
        }
    }
    
    // basic representation of the cardview
    @ViewBuilder
    func symbol(of card: TraditionalSetGame.Card) -> some View {
        switch card.symbol.firstParameter {
        case .oval: Text("draw oval")
        case .diamond: Text("draw oval")
        case .squiggle: Text("draw oval")
        }
    }
}


struct DrawingConstants {
    static let cornerRadius: CGFloat = 5.0
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView(game: TraditionalSetGame())
    }
}
