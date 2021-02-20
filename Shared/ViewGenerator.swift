//
//  ViewGenerator.swift
//  Combine Practice
//
//  Created by Justin Purnell on 2/20/21.
//

import Foundation
import Combine

class ViewGenerator: ObservableObject {
    private var pipeline: CirclePipeline
    @Published var circleView: CircleView = CircleView()
    @Published var isRunning = false
    init() {
        pipeline = CirclePipeline()
        pipeline.$radius
            .dropFirst()
            .map({ r in CircleView(radius: r)})
            .assign(to: &$circleView)
    }
    
    private func connect() {
        pipeline = CirclePipeline()
        pipeline.$radius
            .dropFirst()
            .map({ r in CircleView(radius: r)})
            .assign(to: &$circleView)
        pipeline.start()
        isRunning = true
    }
    
    func start() {
        connect()
    }
    
    func stop() {
        pipeline.stop()
        isRunning = false
    }
}
