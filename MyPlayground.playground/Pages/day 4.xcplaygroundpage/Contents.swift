import Cocoa

// type annotations

let surname: String = "Lasso"
// surname must be a string
//var score: Int = 0
var score: Double = 0
// also work

let playerName: String = "Roy"
let luckyNumber: Int = 13
let pi: Double = 3.141
var isAuthenticated: Bool = true
var albums : [String] = ["Red", "Fearless"]
var user: [String: String] = ["id": "@twostraws"]
var books: Set<String> = Set([
    "The Bluest Eye",
    "Foundation",
    "Girl, Woman, Other"
])

var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]
var teams: [String] = [String]()
var cities: [String] = []
var clues = [String]()

enum UIStyle{
    case light, dark, system
}

var style: UIStyle = UIStyle.light
style = .dark

let usename: String
//this kind of code need type annotations
// lots of complex logic
usename = "@twostraws"
//lots more complex logic
print(usename)

