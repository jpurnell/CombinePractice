//
//  NumberGenerator.swift
//  Combine Practice
//
//  Created by Justin Purnell on 2/18/21.
//

import Foundation
import Combine

class NumberGenerator: ObservableObject {
    private let generate = PassthroughSubject<Int, Never>()
    private var subscription: AnyCancellable?
    lazy private(set) var sharedGenerator: AnyPublisher<Int, Never> = generate
        .share()
        .eraseToAnyPublisher()
}

extension NumberGenerator {
    func next() {
        generate.send(abs(Int(sin(Date().timeIntervalSinceReferenceDate) * 100))  )
    }
    
    func start(every interval: TimeInterval = 0.001
    ) {
        subscription = Timer.publish(every: interval,
                      on: .main,
                      in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.next()
            }
    }
    
    func stop() {
        generate.send(completion: .finished)
        subscription?.cancel()
    }
}
