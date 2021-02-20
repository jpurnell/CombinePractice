//
//  CircleView.swift
//  Combine Practice
//
//  Created by Justin Purnell on 2/18/21.
//

import SwiftUI

struct CircleView: View {
    var radius = 0.0
    
    var body: some View {
        ZStack {
            HStack {
                Text("♥︎").font(.system(size: CGFloat(radius * 1.0))).foregroundColor(.red).opacity(radius / 100).frame(width: CGFloat(radius) * 1.0, height: CGFloat(radius) * 1.0, alignment: .center)
                Text("♥︎").font(.system(size: CGFloat(radius * 1.0))).foregroundColor(.red).opacity(radius / 100).frame(width: CGFloat(radius) * 1.0, height: CGFloat(radius) * 1.0, alignment: .center)
                Text("♥︎").font(.system(size: CGFloat(radius * 1.0))).foregroundColor(.red).opacity(radius / 100).frame(width: CGFloat(radius) * 1.0, height: CGFloat(radius) * 1.0, alignment: .center)
            }
        }
        
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        Text("HI")
    }
}
