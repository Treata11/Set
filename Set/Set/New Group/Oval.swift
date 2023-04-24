//
//  Oval.swift
//  Set
//
//  Created by Treata Norouzi on 10/2/22.
//

import SwiftUI

public struct Oval: InsettableShape {
    var insetAmount = 3.0
    
    public func path(in rect: CGRect) -> Path {
        
        let radius = min(rect.width, rect.height) / 2
    
        var p = Path()
        
        p.addArc(center: CGPoint(x: rect.midX, y: rect.minY + radius - insetAmount), radius: radius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 0), clockwise: false)
        p.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - radius))
        p.addArc(center: CGPoint(x: rect.midX, y: rect.maxY - radius), radius: radius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 180), clockwise: false)
        p.closeSubpath()

        return p
    }
    
    public func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

struct Oval_Previews: PreviewProvider {
    static var previews: some View {
        Oval(insetAmount: 5)
    }
}
