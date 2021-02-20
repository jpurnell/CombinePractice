//
//  CircleView.swift
//  Combine Practice
//
//  Created by Justin Purnell on 2/18/21.
//

import SwiftUI

struct CircleView: View {
    var radius = 0.0
    var area = 0.0
    var circumference = 0.0
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Text("Radius: \(radius)")
                    Text("Area: \(area)")
                    Text("Circumference: \(circumference)")
                }
                HStack {
                    Text("♥︎").font(.system(size: CGFloat(radius * 1.0))).foregroundColor(.red).opacity(radius / 100).frame(width: CGFloat(radius) * 1.0, height: CGFloat(radius) * 1.0, alignment: .center)
                    ZStack {
                        Text("♥︎").font(.system(size: CGFloat(radius * 1.0))).foregroundColor(.red).opacity(radius / 100).frame(width: CGFloat(radius) * 1.0, height: CGFloat(radius) * 1.0, alignment: .center)
                        MyShape(radius: radius, degrees: radius)
                    }

                    Text("♥︎").font(.system(size: CGFloat(radius * 1.0))).foregroundColor(.red).opacity(radius / 100).frame(width: CGFloat(radius) * 1.0, height: CGFloat(radius) * 1.0, alignment: .center)
                }.frame(height: 200, alignment: .center)
            }
        }
        
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        Text("HI")
    }
}
