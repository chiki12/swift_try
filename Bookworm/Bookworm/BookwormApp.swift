//
//  BookwormApp.swift
//  Bookworm
//
//  Created by rachiki on 2024/05/13.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Student.self)
    }
}
