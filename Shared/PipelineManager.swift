//
//  PipelineManager.swift
//  Combine Practice
//
//  Created by Justin Purnell on 2/18/21.
//

import Foundation
import Combine

class PipelineManager: ObservableObject {
    
    private var numberGenerator = NumberGenerator()
    @Published private(set) var isRunning = false
    private(set) var function: (Int) -> Int = { int in int}
    private var subscriptions = Set<AnyCancellable>()
    @Published private(set) var output = 0
    init() {
        numberGenerator.sharedGenerator
            .sink(receiveValue: { int in
            print("Got Value:", int)
        })
            .store(in: &subscriptions)
    }
    
    init(_ generator: NumberGenerator, function: @escaping (Int) -> Int) {
        generator
            .sharedGenerator
            .sink{ _ in }
            .store(in: &subscriptions)
        self.function = function    
    }
}

extension PipelineManager {
    
    private func connect() {
        transformer(self.numberGenerator.sharedGenerator, function)
    }
    
    private func transformer(_ publisher: AnyPublisher<Int, Never>, _ function: @escaping (Int) -> Int) {
        publisher
            .dropFirst()
            .print("Passed")
            .map(function)
            .print("Transformed")
            .assign(to: &$output)
    }
    
    func start() {
        connect()
        numberGenerator.start(every: 1)
        isRunning = true
    }
    
    func stop() {
        numberGenerator.stop()
        isRunning = false
    }
}
