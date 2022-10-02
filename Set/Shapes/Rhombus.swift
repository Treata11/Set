//
//  Rhombus.swift
//  Set
//
//  Created by Treata Norouzi on 9/30/22.
//

import SwiftUI

struct Rhombus: Shape {
    var aspectRatio: CGFloat = 1.618
    
    func path(in rect: CGRect) -> Path {
        
        var p = Path()
        
        p.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        p.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        p.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        p.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return p
    }
}
