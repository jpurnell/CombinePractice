//
//  Arc.swift
//  Combine Practice
//
//  Created by Justin Purnell on 2/20/21.
//

import SwiftUI

struct Arc: View {
    var body: some View {
        MyShape()
    }
}

struct Arc_Previews: PreviewProvider {
    static var previews: some View {
        MyShape(radius: 50, degrees: 90)
    }
}

struct MyShape : Shape {
    var radius: Double = 0.0
    var degrees: Double = 0.0
    
    func path(in rect: CGRect) -> Path {
        var p = Path()

        p.addArc(center: CGPoint(x: 100, y: 100),
                 radius: CGFloat(radius),
                 startAngle: .degrees(-90),
                 endAngle: .degrees(-90 + (degrees * 3.6)),
                 clockwise: false
        )
        return p.strokedPath(.init(lineWidth: 3)
        )
    }
}
