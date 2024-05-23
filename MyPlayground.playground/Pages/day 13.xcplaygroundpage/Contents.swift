import Cocoa

protocol Vehicle {
//    its not possible to create set-only properties in swift
    var name: String { get }
//    get : read     set: write
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
    // no function bodies allowed
}

protocol CanBeElectric {
    
}
// a protocol is like a requirement but you can add new functions in the struct

struct Car: Vehicle, CanBeElectric {
    let name = "Car"
    var currentPassengers = 1
//     all the func in the protols have to appear in the struct
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance) km")
    }
    
    func openSunroof() {
        print("It's a nice day")
    }
}

struct Bicycle: Vehicle {
    let name = "Bicycle"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    func travel(distance: Int) {
        print("I'm cycling \(distance) km")
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimate(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance) km")
    }
}

let car = Car()
commute(distance: 100, using: car)

let bike = Bicycle()
commute(distance: 50, using: bike)

getTravelEstimate(using: [car, bike], distance: 150)

// opaque return type

func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber())

// How to create and use extensions

var quote = "   The truth is rarely pure and never simple    "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    // if you are returning a new value, usually use -ed
    mutating func trim() {
        self = self.trimmed()
    }
    // usually change current value
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

let trimmed2 = quote.trimmed()
print(trimmed)

// code completion; code organization; internal access;

let lyrics = """
But i keep crusing
can't stop, won't stop moving
it's like i got this music in my mind
saying it's gonna be alright
"""

print(lyrics.lines)

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}
let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)


// how to create and use protocol extensions

//technique apple called protocol oriented programming
// arrays, sets, and dictionaries, as well as any other types that conform to Collection
extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
        // so you dont need to write this function inside struc
    }
}
struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()

// protocols are like contracts for code
// Opaque return types let us hide some information in our code
// Extensions let us add functionality to existing types
// Protocol extensions lets us add functionality to many types all at once

