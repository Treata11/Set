//
//  SetGame.swift
//  Set
//
//  Created by Treata Norouzi on 4/21/23.
//

import SwiftUI

class SetGame: ObservableObject {
    var model = SET<SetShape, Int, Color, Shade>.self
    
}

enum SetShape: Hashable {
    case squiggle
    case capsule
    case diamond
}
