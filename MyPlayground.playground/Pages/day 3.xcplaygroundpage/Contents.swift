import Cocoa

var beatles = ["John", "Paul", "George", "Ringo"]
// array of strings
let numbers = [4, 8, 15, 16, 23, 42]
// array of intagers
var temperatures = [25.3, 28.2, 26.4]
// array of decimals

// index: 0, 1, 2, 3, ...

beatles.append("Adrian")
//add Adrian at the end of the array
// can only add one type of data

var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(81)
print(scores[1])

//var albums = Array<String>()
var albums = [String]()
// it must always know what type of data the list is storing
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")


// functions

print(albums.count)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
characters.remove(at: 2)
print(characters.count)

characters.removeAll()
print(characters.count)

let bondMovies = ["Casino Royale", "Spectre", "No Time to Die"]
print(bondMovies.contains("Frozen"))

let cities = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted())

let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversePresidents = presidents.reversed()
print(reversePresidents)

var employee = ["Taylor Swift", "Singer", "Nashvile"]
print("Name: \(employee[0])")
// if add employee.remove(at: 1) it will be problematic
print("Job title: \(employee[1])")
print("Location: \(employee[2])")

let employee2 = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]
print(employee2["name", default: "Unknown"])
print(employee2["job", default: "Unknown"])
print(employee2["location", default: "Unknown"])

let hasGraduated = [
    "Eric": false,
    "Maeve": true,
    "Otis": false
]

let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo"
]

print(olympics[2012, default: "Unknown"])

var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 226

var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
archEnemies["Batman"] = "Penguin"


// SETS

let actors_ = Set([
    "Denzel Washington",
    "Tom Cruise",
    "Nicolas Cage",
    "Samuel L Jackson"
])
// sets dont remember the order and dont allow duplicate
print(actors_)

var actors = Set<String>()
actors.insert("Denzel Washington")
actors.insert("Tom Cruise")
actors.insert("Nicolas Cage")
actors.insert("Samuel L Jackson")
print(actors)
//sets make it fast to locate items


// ENUM: enumeration- is a set of named values we can create and use in our code
// more efficient and safer

var selected = "Monday"
selected = "Tuesday"
selected = "Janurary"
selected = "Friday " // has an extra space

//enum Weekday{
//    case monday
//    case tuesday
//    case wednesday
//    case thursday
//    case friday
//}

enum Weekday{
    case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.monday
day = .tuesday // must be chosen from Weeday bc day is made from Weekday
day = .friday





