//
//  CirclePipeline.swift
//  Combine Practice
//
//  Created by Justin Purnell on 2/18/21.
//

import Foundation
import Combine

class CirclePipeline: ObservableObject {
    private(set) var numberGenerator = NumberGenerator()
    @Published var radius: Double = 0.0
    @Published var area: Double = 0.0
    @Published var circumference: Double = 0.0
    @Published var circleView = CircleView()
    @Published private(set) var isRunning = false
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        numberGenerator = NumberGenerator()
    }
    
    private func radiusPipeline() {
        numberGenerator.sharedGenerator
            .map{ int in
                Double(int)
            }
            .assign(to: &$radius)
    }
        
    private func areaPipeline() {
        $radius.map{ r in
            r * r * .pi
        }
        .assign(to: &$area)
    }
    
    private func circumferencePipeline() {
        $radius.map { r in
            .pi * 2.0 * r
        }
        .assign(to: &$circumference)
    }
    
    private func connect() {
        radiusPipeline()
        areaPipeline()
        circumferencePipeline()
        isRunning = true
    }
    
    func start() {
        connect()
        numberGenerator.start()
        isRunning = true
    }
    
    func stop() {
        numberGenerator.stop()
        isRunning = false
    }
}
