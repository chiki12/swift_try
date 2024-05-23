//: [Previous](@previous)

import Foundation


//: [Next](@next)
// How to store truth with Booleans

let goodDogs = true
var gameOver = false
print(gameOver)
gameOver.toggle()
print(gameOver)


let isMultiple = 120.isMultiple(of: 3)

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

// How to join strings together
let firstPart = "Hello, "
let secondPart = "world!"
let greeting = firstPart + secondPart

let people = "Haters"
let action = "hate"
let lyric =  people + " gonna " + action
print(lyric)
// its very wasterful is you want to a lot of strings together by "+"

let quote = "Then he tapped a sign saying \"believe\" and walked away."

let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."
// this is called string interpolation
print(message)

let number = 11
let missionMessage = "Apollo " + String(number) + " landed on the moon."

print("5 x 5 is \(5 * 5)")
