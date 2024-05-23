//
//  Student.swift
//  Bookworm
//
//  Created by rachiki on 2024/05/13.
//

import Foundation
import SwiftData

@Model
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
