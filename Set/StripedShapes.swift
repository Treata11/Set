//
//  StripedShapes.swift
//  Set
//
//  Created by Treata Norouzi on 4/24/23.
//

import SwiftUI

struct Line: Shape {
    var lineWidth: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        p.move(to: CGPoint(x: rect.minX, y: rect.midY))
        p.addLines([
            CGPoint(x: rect.minX, y: rect.midY - lineWidth/2),
            CGPoint(x: rect.maxX, y: rect.midY - lineWidth/2),
            CGPoint(x: rect.maxX, y: rect.midY + lineWidth/2),
            CGPoint(x: rect.minX, y: rect.midY + lineWidth/2)
        ])
        return p
    }
}

struct Stripes: View {
    var stripeCount: Int
    var lineWidth: CGFloat
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<stripeCount, id: \.self) { _ in
                Line(lineWidth: lineWidth)
            }
        }
    }
}

//struct Line_Previews: PreviewProvider {
//    static var previews: some View {
//        Line(lineWidth: 4)
//    }
//}

struct StripedShapes_Previews: PreviewProvider {
    static var previews: some View {
        Rectangle()
            .foregroundColor(.black)
            .mask(Stripes(stripeCount: 50, lineWidth: 10).foregroundColor(.white))
    }
}
