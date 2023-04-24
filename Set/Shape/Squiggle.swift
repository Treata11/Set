//
//  Squiggle.swift
//  Set
//
//  Created by Treata Norouzi on 10/2/22.
//

import SwiftUI

public struct Squiggle: InsettableShape {
    var insetAmount = 0.0
    
    public func path(in rect: CGRect) -> Path {
        let offset = min(rect.width-insetAmount, rect.height-insetAmount) / 13

        var P = Path()

        P.move(to: CGPoint(x: rect.minX+3*offset, y: rect.minY+1.25*offset))
        P.addCurve(to: CGPoint(x: rect.maxX-2*offset, y: rect.maxY-3*offset),
                      control1: CGPoint(x: rect.maxX+7*offset, y: rect.minY+4*offset),
                      control2: CGPoint(x: rect.minX, y: rect.midY+2*offset))
        P.addQuadCurve(to: CGPoint(x: rect.maxX-3*offset, y: rect.maxY-1.25*offset),
                          control: CGPoint(x: rect.maxX-0.5*offset, y: rect.maxY-1.25*offset))

        P.addCurve(to: CGPoint(x: rect.minX+2*offset, y: rect.minY+3*offset),
                      control1: CGPoint(x: rect.minX-7*offset, y: rect.maxY-4*offset),
                      control2: CGPoint(x: rect.maxX, y: rect.midY-2*offset))
        P.addQuadCurve(to: CGPoint(x: rect.minX+3*offset, y: rect.minY+1.25*offset),
                          control: CGPoint(x: rect.minX+0.5*offset, y: rect.minY+1.25*offset))

        return P
    }
    public func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}
struct Squiggle_Previews: PreviewProvider {
    static var previews: some View {
        Squiggle(insetAmount: 20)
    }
}
