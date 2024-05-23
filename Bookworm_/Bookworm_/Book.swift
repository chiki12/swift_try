//
//  Book.swift
//  Bookworm_
//
//  Created by rachiki on 2024/05/13.
//

import Foundation
import SwiftData

@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    let date: String
    
    init(title: String, author: String, genre: String, review: String, rating: Int, date: String) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
        self.date = date
    }
}
