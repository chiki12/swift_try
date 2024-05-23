import Cocoa
// Cocoa is a library created by Apple that has a lot of valuable function
var greeting = "Hello, playground"
// var: create a new variable
// you dont use semicolon in swift language

var name = "Ted"
name =  "Rebecca"
name = "Keeley"

let character = "Daphne"
//let:  constants you cannot change it

var playerName = "Roy"
print(playerName)

playerName = "Dani"
print(playerName)

playerName = "Sam"
print(playerName)

// try to use constant much more than variable as much as you can


// HOW TO CREATE STRINGS

let actor = "Denzel Washington"
let result = "⭐️ You Win!"
// strings start and end with double quotes
// push backslash before quotes so swift knows you are not trying to end the string


let movie = """
A day in
the life of an
Apple engineer
"""
// the final three quotes must be on a line by themselves

let nameLength = actor.count
let filename = "paris.jpg"
print(nameLength)

print(result.debugDescription.uppercased())

print(movie.hasPrefix("A day"))
print(filename.hasSuffix(".jpg"))
// be careful with lowercase and uppercase


// How to store whole numbers

// use underscore to break big numbers
let score = 10
let reallyBig = 100_000_000 // swift just ignore the underscores

let lowerScre = score - 2
let higherScore = score + 10
let doubledScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2

var counter = 10
counter = counter + 5
print(counter)

counter *= 2
counter -= 10
counter /= 2

print(120.isMultiple(of: 3))

// HOW TO STORE DECIMAL NUMBER

let number = 0.1 + 0.2
print(number)

let a = 1
let b = 2.0
let c = a + Int(b) // or Double(a) + b
// you cannot mix doubles and integars

let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0
let int1 = 3

var name1 = "Nicolas Cage"
name1 = "John Travolta"

var rating = 5.0
rating *= 2
