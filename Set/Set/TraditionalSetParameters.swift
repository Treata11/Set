//
//  TraditionalSetParameters.swift
//  Set
//
//  Created by Treata Norouzi on 4/24/23.
//

import Foundation

enum Symbol: Hashable, CaseIterable {
    case oval
    case diamond
    case squiggle
}

enum Shade: CaseIterable, Equatable, Hashable {
    case solid(opacity: Double = 1)
    case striped(count: Int = 7)
    case clear(opacity: Double = 0.3)

    static var allCases: [Shade] = [
        .solid(opacity: 1), .striped(count: 9), .clear(opacity: 0.3)
    ]
}

enum Hue: Hashable, CaseIterable {
    case red
    case green
    case purple
}

enum Counter: Int, CaseIterable {
    case one = 1
    case two
    case three
}

struct TraditionalSetParameter {
    var oval = Symbol.oval
    
//    switch oval {
//    case .oval:
//        let shape = Oval()
//    case .diamond:
//        let shape = Rhombus()
//    default:
//        let shape = Squiggle()
//    }
}
