//
//  TraditionalSetGame.swift
//  Set
//
//  Created by Treata Norouzi on 4/21/23.
//

import SwiftUI

class TraditionalSetGame: ObservableObject {
    typealias Card = SET<Symbol, Shade, Counter, Hue>.Card
    
    private(set) static var cardContents: [Card.CardContent] = {
        var contents = [Card.CardContent]()
        
        for shape in Symbol.allCases {
            for shading in Shade.allCases {
                for index in Counter.allCases {
                    for color in Hue.allCases {
                        contents.append(
                            Card.CardContent(
                                firstParameter: shape,
                                secondParameter: shading,
                                thirdParameter: index,
                                forthParameter: color
                            )
                        )
                    }
                }
            }
        }
        
        return contents.shuffled()
    }()
    
    static func createSetGame() -> SET<Symbol, Shade, Counter, Hue> {
        SET(numberOfCardsToBeShown: 27, totalNumberOfOfCards: Int(floor(Double(cardContents.count)))) {    // Horrible type convertion
            cardContents[$0]
        }
    }
    
    // MARK: - Access to to the Model
    
    @Published private var model = createSetGame()
    
    var score: Int {
        model.score
    }
    
    var cards: [Card] {
        model.cards
    }
    
    // MARK: Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}

