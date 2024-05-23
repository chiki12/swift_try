import Cocoa

// standard of swift: use Cap letter at the beginning
struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

struct Employee {
    let name: String // if let you cant change the name if you set a default
    var vacationRemaining: Int = 14
    
    //have to use mutating func if you wanna change the data
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

// swift can only call mutating function on variables
//var archer = Employee.init(name: "Sterling Archer", vacationRemaining: 14)
var archer1 = Employee(name: "Sterling Archer")
// its same without .init
archer1.takeVacation(days: 5)
print(archer1.vacationRemaining)

let a = 1
let b = 2.0
let c = Double(a) + b

let kane = Employee(name: "Lana Kane")
let poovey = Employee(name: "Pam Poovey", vacationRemaining: 35)

// stored property and computed property
struct Employee2 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    // calculated dynamically
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        
        set {
            vacationAllocated = vacationTaken + newValue
        } // newValue stores whatever value the user was trying to assign to the property.
    }
}

var archer = Employee2(name: "Sterling Archer", vacationAllocated: 14)
archer.vacationTaken += 4
archer.vacationRemaining = 5
print(archer.vacationAllocated)

// property observers
struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1

struct App {
    var contacts = [String]() {
// a didSet observer to run when the property just changed
// a willSet observer to run before the property changed.
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }
        didSet {
            print("There are now \(contacts.count) contacts")
            print("Old value was: \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")

// custom initialize

struct Player {
    let name: String
    let number: Int
    
//    there is no FUNC word here
//    no explicit return type
//    use self. to assign values
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Megan R")
print(player.number)
