//
//  ContentView.swift
//  Shared
//
//  Created by Justin Purnell on 2/18/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var pipelineOne = ViewGenerator()
    
    var body: some View {
        VStack {
            pipelineOne.circleView
                .frame(height: 200, alignment: .center)
            HStack {
                Button("Start"){
                    pipelineOne.start()
                }
                .disabled(pipelineOne.isRunning)
                Button("Stop") {
                    
                    pipelineOne.stop()
                }
                .disabled(!pipelineOne.isRunning)
            }
            HStack {
                MyShape(radius: 50, degrees: pipelineOne.circleView.radius).frame(alignment: .center)
                MyShape(radius: 50, degrees: pipelineOne.circleView.radius + 25).frame(alignment: .center)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
