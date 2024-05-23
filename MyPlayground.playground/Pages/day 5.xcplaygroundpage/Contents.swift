import Cocoa

let score = 85
if score > 80 {
    print("Great job!")
}
// open brace and close brace


let speed = 88
let percentage = 85
let age_ = 18
if speed >= 88 {
    print("Where we are going, we don't need roads.")
}

if percentage < 85 {
    print("Sorry, you failed the test.")
}

if age_ >= 18 {
//    print("You're eligible to vote")
    print("This will be run if the conditino is true.")
} else {
    print("This will be run if the condition is false")
}

let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"
if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}

if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}

var numbers = [1,2,3]
numbers.append(4)
if numbers.count > 3 {
    numbers.remove(at: 0)
}
print(numbers)

let country = "Canada"

if country == "Australia"{
    print("G' day!")
}

let name = "Taylor Swift"

if name != "Anonymous" {
    print("Welcome, \(name)")
}

var username = "taylorswift13"

if username.isEmpty {
    username = "Anonymous"
}

print("Welcome, \(username)")

let temp = 25

if temp > 25 && temp < 30 {
    print("It's a nice day")
}

let userAge = 14
let hasParentalConsent = true

if age >= 18 || hasParentalConsent {
    print("You can buy the game!")
}

enum TransportOption {
    case airplane, helicopter, bicycle, car, escooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there's a bike path...")
} else if  transport == .car {
    print("Time to get stuck in traffic.")
} else {
    print("I'm going to hire a scooter now!")
}

// different ways for checking conditions
enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun


switch forecast {
case .sun:
    print("It should be a nice day.")
case .rain:
    print("Pack an umbrella.")
case .wind:
    print("Wear something warm")
case .snow:
    print("School is cancelled.")
case .unknown:
    print("Our forecaset generator is broken!")
}
// exhaustive, swift requires to check all the conditions

let place = "Metropolis"
switch place {
case "Gotham":
    print("You're Batman!")
case "Mega-City One":
    print("You're Judge Dredd!")
case "Wakanda":
    print("You're Black Panther!")
default:
    print("Who are you?")
}

// FALLTHROUGH

let day = 5
print("My true love gave to me...")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 caling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
    
}

// ternary conditional operator
// ternary: use three pieces of data at one time

let age = 18
let canVote = age >= 18 ? "Yes" : "No"
// W? T: F
print(canVote)

let hour = 23
print(hour < 12 ? "It's before noon" : "It's after noon")

let names = ["Jayne", "Kaylee", "Mal"]
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"
print(crewCount)

enum Theme {
    case light, dark
}
let theme = Theme.dark
let background = theme == .dark ? "black" : "white"
print(background)

// we cant put if else stuff inside print()
