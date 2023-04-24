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
        AspectVGrid(items: game.cards, aspectRatio: 5/8) { card in
            CardView(card: card)
                .onTapGesture {
                    game.choose(card)
                }
        }
    }
}

struct CardView: View {
    let card: TraditionalSetGame.Card
    
    var body: some View {
        ZStack {
            let cardShape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)

            cardShape.fill(Color.white)
            cardShape.strokeBorder(lineWidth: DrawingConstants.effectLineWidth)
                .foregroundColor(.accentColor)
//            Text(game.cards)
            VStack {
                // bogus: Fix .rawValue!
                ForEach(0..<card.symbol.thirdParameter.rawValue, id: \.self) { _ in
                    symbol(of: card)
                }
            }
            .padding()
        }
    }
    
    // basic representation of the cardviewg
    @ViewBuilder
    func symbol(of card: TraditionalSetGame.Card) -> some View {
        switch card.symbol.firstParameter {
        case .oval: drawContent(
            of: card.symbol,
            with: Oval()
        )
        case .diamond: drawContent(
            of: card.symbol,
            with: Rhombus()
        )
        case .squiggle: drawContent(
            of: card.symbol,
            with: Squiggle()
        )
        }
    }
    
    @ViewBuilder
    func drawContent<Symbol>(of contex: TraditionalSetGame.Card.CardContent, with symbol: Symbol) -> some View where Symbol: Shape {
        switch contex.secondParameter {
        case .solid(let opacity):
            symbol.fill()
                .foregroundColor(color(of: contex))
                .aspectRatio(DrawingConstants.symbolAspectRatio, contentMode: .fit)
                .opacity(opacity)
        case .clear(let opacity):
            symbol.fill()
                .foregroundColor(color(of: contex))
                .aspectRatio(DrawingConstants.symbolAspectRatio, contentMode: .fit)
                .opacity(opacity)
        case .striped(let stripeCount):
            symbol.fill()
                .foregroundColor(color(of: contex))
                .aspectRatio(DrawingConstants.symbolAspectRatio, contentMode: .fit)
            // TODO: mask (overylay) the symbol with the number of stripes
///                .mask(stripe * stripeCount)
        }
    }
    
    func color(of cardContex: TraditionalSetGame.Card.CardContent) -> Color {
        switch cardContex.forthParameter {
        case .red: return Color.red
        case .green: return Color.green
        case .purple: return Color.purple
        }
    }
}

struct DrawingConstants {
    static let cornerRadius: CGFloat = 5.0
    // TODO: Calculate the aspect ratio to be as good looking as possible
    static let symbolAspectRatio: CGFloat = 1
    static let defaultLineWidth: CGFloat = 2
    static let effectLineWidth: CGFloat = 3
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView(game: TraditionalSetGame())
    }
}
