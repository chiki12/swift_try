//
//  Bookworm_App.swift
//  Bookworm_
//
//  Created by rachiki on 2024/05/13.
//

import SwiftData
import SwiftUI

@main
struct Bookworm_App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
