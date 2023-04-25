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
    
    private(set) var score = 0
    
    var numberOfCardsToBeShown: Int
    
    private var chosenCardsIndices = Set<Int>()
    
//    var cardContentFactory: (Int) -> Card.CardContent    // be used in the init
    
//    init(cards: Array<Card>, cardContentFactory: @escaping (Int) -> Card.CardContent) {
//        self.cards = cards
//        self.cardContentFactory = cardContentFactory
//    }
    
    init(numberOfCardsToBeShown: Int, totalNumberOfOfCards: Int, cardContentFactory: (Int) -> Card.CardContent) {
        cards = Array<Card>()
        self.numberOfCardsToBeShown = 27
        for cardIndex in 0..<totalNumberOfOfCards {
            let content = cardContentFactory(cardIndex)
            cards.append(Card(symbol: content, id: cardIndex))
            // TODO: Change the ID to string raw value
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { card.id == $0.id } ) {
            cards[chosenIndex].isSelected = true
            chosenCardsIndices.insert(cards[chosenIndex].id)
            if cards[chosenIndex].isSelected {
                if chosenCardsIndices.count == 3 {
                    // do the set here
//                    chosenCardsIndices.forEach({ index in set(cards[index]) })
                    chosenCardsIndices.forEach({ iD in
                        if let chosenIndex = cards.firstIndex(where: { $0.id == iD } ) {
                            set(cards[chosenIndex])
                        }
                        
                    })
                    // can't have more than 3 cards selected
                }
            }
            print("\(chosenCardsIndices)")
        }
    }
    
//    mutating func deselect(_ card: Card) {
//        if let selectedIndex = cards.firstIndex(where: { card.id == $0.id } ) {
//            if cards[selectedIndex].isSelected {
//                chosenCardsIndices.remove(at: cards[selectedIndex].id)
//            }
//        }
//    }
    
    mutating func deal(a card: Card) {
        self.numberOfCardsToBeShown += 1
        score -= 1
    }
    
    private mutating func set(_ card: Card) {
        if chosenCardsIndices.count == 3 {
            var shapes: Set<α> = []
            var counter = Set<β>()
            var color = Set<γ>()
            var shading = Set<δ>()

            chosenCardsIndices.forEach({ iD in
                    if let chosenIndex = cards.firstIndex(where: { $0.id == iD } ) {
                    shapes.insert(cards[chosenIndex].symbol.firstParameter)
                    counter.insert(cards[chosenIndex].symbol.secondParameter)
                    color.insert(cards[chosenIndex].symbol.thirdParameter)
                    shading.insert(cards[chosenIndex].symbol.forthParameter)
                }
            })
            let differentials = [shapes.count, counter.count, color.count, shading.count]
            
            if differentials.contains(1) {  // indicating no differential in an element
                chosenCardsIndices.forEach({ iD in
                    if let chosenIndex = cards.firstIndex(where: { $0.id == iD } ) {
                        cards[chosenIndex].isMatched = true
                        cards.remove(at: chosenIndex) // Extreme!
                        // The card is removed for the viewcontainer to have more space to offer to subviews
                    }
                })
                chosenCardsIndices.removeAll()
                score += 4
            } else if differentials.contains(2) {
                score -= 2
            } else if differentials.contains(3) {
                score -= 3
            } else {
                score += 12
            }
            // All cards are deselected wether a match did take place or not
            chosenCardsIndices.forEach({ iD in
                if let chosenIndex = cards.firstIndex(where: { $0.id == iD } ) {
                    cards[chosenIndex].isSelected = false
                }
            })
//            chosenCardsIndices.forEach({ index in cards[index].isSelected = false })
            // TODO: not cards at that index, cards with that id
            chosenCardsIndices = []
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
    
    struct Card: Identifiable, Equatable {
//        weak var set: SET<α, β, γ, δ>?
        let symbol: CardContent
        var isFaceUp: Bool = true
        var isSelected: Bool = false
        var isMatched: Bool = false
        let id: Int
        
        static func == (lhs: SET<α, β, γ, δ>.Card, rhs: SET<α, β, γ, δ>.Card) -> Bool {
            lhs.id == rhs.id
        }
        
        // MARK: - Card Content
        
        struct CardContent {
            let firstParameter: α
            let secondParameter: β
            let thirdParameter: γ
            let forthParameter: δ
        }
    }
}

// NOTE:
// so, the model above, is extremely error-prone on behalf of
// lack of usage of property-observers and ineffective code used around.
