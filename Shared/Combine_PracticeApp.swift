//
//  Combine_PracticeApp.swift
//  Shared
//
//  Created by Justin Purnell on 2/18/21.
//

import SwiftUI

@main
struct Combine_PracticeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(NumberGenerator(), { x in x + 1}, { y in y * 1})
        }
    }
}
