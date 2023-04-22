//
//  Set.swift
//  Set
//
//  Created by Treata Norouzi on 4/17/23.
//

import Foundation

struct SET<α, β, γ, δ>
where α: Hashable, β: Hashable, γ: Hashable, δ: Hashable {
    var cards: Array<Card>
    
    var score = 0
    
    var chosenCardsIndices = Array<Int>()
    
    var createCardContent: (Int) -> Card.CardContent    // be used in the init
    
    init(cards: Array<Card>, score: Int = 0, chosenCardsIndices: Array<Int> = Array<Int>(), createCardContent: @escaping (Int) -> Card.CardContent) {
        self.cards = cards
        self.score = score
        self.chosenCardsIndices = chosenCardsIndices
        self.createCardContent = createCardContent
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { card.id == $0.id } ) {
            cards[chosenIndex].isSelected = !cards[chosenIndex].isSelected
            if cards[chosenIndex].isSelected {
                if chosenCardsIndices.count > 3 {
                    chosenCardsIndices.removeFirst()
                    chosenCardsIndices.append(chosenIndex)
                    // can't have more than 3 cards selected
                }
            }
            
            if chosenCardsIndices.count == 3 {
                // do the set here
                cards.forEach( { card in
                  set(card)
                } )
            }
        }
    }
    
    mutating func set(_ card: Card) {
        if chosenCardsIndices.count == 3 {
            var shapes: Set<α> = []
            var counter = Set<β>()
            var color = Set<γ>()
            var shading = Set<δ>()
            
            for index in chosenCardsIndices {
                shapes.insert(cards[index].symbol.firstParameter)
                counter.insert(cards[index].symbol.secondParameter)
                color.insert(cards[index].symbol.thirdParameter)
                shading.insert(cards[index].symbol.forthParameter)
            }
            let differentials = [ shapes.count, counter.count, color.count, shading.count]
            
            if differentials.contains(1) {  // indicating no differential in an element
                for index in chosenCardsIndices {
                    cards[index].isSelected = true
                }
                score += 4
            } else if differentials.contains(2) {
                score -= 2
            } else if differentials.contains(3) {
                score -= 3
            } else {
                score += 12
            }
            chosenCardsIndices = [] // All cards are deselected on a match
        }
    }
    
//    mutating func formASet(with cards: [Card]) {
//        var shapes = Set<α>()
//        var colors = Set<Color>()
//        var counts = Set<Int>()
//        var shadings = Set<β>()
//
//        cards.forEach( { card in
//            shapes.insert(card.symbol.shape)
//            colors.append(cards[index])
//            counts.append(cards[index])
//            shadings.append(cards[index])
//        } )
//    }
    
//    mutating func createSets(of card: Card) {
//        for shapeCount in card.count {
//            for shape in card.symbol {
//                for color in card.color {
//                    cards.append(card)
//                }
//            }
//        }
//    }
    
    struct Card: Identifiable {
        var symbol: CardContent
        var isFaceUp: Bool = true
        var isSelected: Bool = false
        var isMatched: Bool
        var id: Int
        
        struct CardContent {
            var firstParameter: α
            var secondParameter: β
            var thirdParameter: γ
            var forthParameter: δ
        }
    }
}

enum Shade: CaseIterable, Equatable, Hashable {
    case solid(opacity: Double = 1)
    case striped(count: Int = 7)
    case clear(opacity: Double = 0.3)

    static var allCases: [Shade] = [
        .solid(opacity: 1), .striped(count: 9), .clear(opacity: 0.3)
    ]
}
