//
//  TraditionalSetGame.swift
//  Set
//
//  Created by Treata Norouzi on 4/21/23.
//

import SwiftUI

class TraditionalSetGame: ObservableObject {
    typealias Card = SET<Symbol, Shade, Counter, Hue>.Card
    
    static var cardContent: [Card.CardContent] {
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
                                forthParameter: color)
                        )
                    }
                }
            }
        }
        
        return contents.shuffled()
    }
    
    static func cardContentFactory(with pairIndex: Int) -> SET<Symbol, Shade, Counter, Hue> {
        let content = [Capsule(), Circle(), Rectangle()] as [Any]
        
        return SET<Symbol, Shade, Counter, Hue>(numberOfPairsOfCards: pairIndex) { _ in
            return content[pairIndex] as! SET<Symbol, Shade, Counter, Hue> .Card.CardContent
        }
    }
    
//    func createSetGame() -> SET<SetShape, Int, Color, Shade> {
//        // initialize the model:
//        // required:
//        return SET(
//            numberOfPairsOfCards: content.count,
//            cardContentFactory: <#T##(Int) -> SET<Hashable, Hashable, Hashable, Hashable>.Card.CardContent#>
//        )
//    }
    
}

