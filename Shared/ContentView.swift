//
//  ContentView.swift
//  Shared
//
//  Created by Justin Purnell on 2/18/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var pipelineOne = ViewGenerator()
    var numbers: NumberGenerator
//    var pipelineTwo: PipelineManager
//    var pipelineThree: PipelineManager
    var isRunning: Bool = false
    
    init(_ numberGenerator: NumberGenerator, _ firstFunction: @escaping (Int) -> Int, _ secondFunction: @escaping (Int) -> Int) {
        self.numbers = numberGenerator
//        self.pipelineTwo = PipelineManager(numberGenerator, function: firstFunction)
//        self.pipelineThree = PipelineManager(numberGenerator, function: secondFunction)
    }
    
    var body: some View {
        VStack {
//            HStack {
//                Text("\(pipelineTwo.output)")
//                    .padding()
//                Text("\(pipelineThree.output)")
//                    .padding()
//            }
            pipelineOne.circleView
                .frame(height: 200, alignment: .center)
            HStack {
                Button("Start"){
                    pipelineOne.start()
//                    isRunning.toggle()
//                    pipelineTwo.start()
//                    pipelineThree.start()
                }
                .disabled(pipelineOne.isRunning)
                Button("Stop") {
                    
                    pipelineOne.stop()
//                    pipelineTwo.stop()
//                    pipelineThree.stop()
                }
                .disabled(!pipelineOne.isRunning)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(NumberGenerator(), {int in int * 1}, {int in int * 1})
    }
}
