//
//  Rhombus.swift
//  Set
//
//  Created by Treata Norouzi on 9/30/22.
//

import SwiftUI

struct Rhombus: InsettableShape {
    var aspectRatio: CGFloat = 1.618
    
    var insetAmount = 0.0
    
    func path(in rect: CGRect) -> Path {
        
        let start = CGPoint(x: rect.maxX-insetAmount, y: rect.midY)
        let secondVertix = CGPoint(x: rect.midX, y: rect.maxY-insetAmount)
        let thirdVertix = CGPoint(x: rect.minX+insetAmount, y: rect.midY)
        let end = CGPoint(x: rect.midX, y: rect.minY+insetAmount)
        
        var p = Path()
        
        p.move(to: start)
        p.addLine(to: secondVertix)
        p.addLine(to: thirdVertix)
        p.addLine(to: end)
        
        return p
    }
    func inset(by amount: CGFloat) -> some InsettableShape {
        var Line = self
        Line.insetAmount += amount
        return Line
    }
}

struct Rhombus_Previews: PreviewProvider {
    static var previews: some View {
        Rhombus(aspectRatio: 1, insetAmount: 40).foregroundColor(.red)
    }
}
