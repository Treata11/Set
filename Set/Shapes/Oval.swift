//
//  Oval.swift
//  Set
//
//  Created by Treata Norouzi on 10/2/22.
//

import SwiftUI

struct Oval: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let radius = min(rect.width, rect.height) / 2
        
        var p = Path()
        
        p.addArc(center: CGPoint(x: rect.midX, y: rect.minY + radius), radius: radius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 0), clockwise: false)
        p.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - radius))
        p.addArc(center: CGPoint(x: rect.midX, y: rect.maxY - radius), radius: radius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 180), clockwise: false)
        p.closeSubpath()

        return p
    }
}

struct Oval_Previews: PreviewProvider {
    static var previews: some View {
        Oval()
    }
}
