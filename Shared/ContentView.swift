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
            Spacer()
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
            ZStack {
                MyShape(radius: 70, degrees: pipelineOne.circleView.radius).frame(alignment: .center).foregroundColor(.purple)
                MyShape(radius: 60, degrees: pipelineOne.circleView.radius).frame(alignment: .center).foregroundColor(.blue)
                MyShape(radius: 50, degrees: pipelineOne.circleView.radius).frame(alignment: .center).foregroundColor(.green)
                MyShape(radius: 40, degrees: pipelineOne.circleView.radius).frame(alignment: .center).foregroundColor(.yellow)
                MyShape(radius: 30, degrees: pipelineOne.circleView.radius).frame(alignment: .center).foregroundColor(.orange)
                MyShape(radius: 20, degrees: pipelineOne.circleView.radius).frame(alignment: .center).foregroundColor(.red)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
