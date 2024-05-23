import Cocoa

var name = "Ted"
name = "Rebecca"
let user = "Daphne"
print(user)

let quote = "He tapped a sign saying \"believe\" and walked away"
let movie = """
A day in
the life of an
Apple engineer
"""
print(quote.count)
print(quote.hasPrefix("He"))
print(quote.hasSuffix("Away."))

var colors = ["Red", "Green", "Blue"]
print(colors[0])
colors.append("Tartan") // the value must matchthe type of arrays

var numbers = Set([1,1,3,5,7,9])
print(numbers)

enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

let player: String = "Roy"
var luckyNumber: Int = 13
let pi: Double = 3.141
var isEnabled: Bool = true

var albums: Array<String> = ["Red", "Fearless"]
// or [String]
var user1: Dictionary<String, String> = ["id": "@twostraws"]
// or [String: String]
var books: Set<String> = Set(["The Bluest Eye", "Foundation"])

let sayHello = { (name: String) -> String in
    "Hi, \(name)!"
}

let team = ["Gloria", "Suzanne", "Tiffany", "Tasha"]
let onlyT = team.filter{ $0.hasPrefix("T")}
print(onlyT)
