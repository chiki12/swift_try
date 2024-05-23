import Cocoa

struct BankAccount {
    private(set) var funds = 0 //access control this can only be changed  inside the struct
    mutating func deposit(amount: Int) {
        funds += amount
    }
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)

let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

// private Don't let anything outside the struct use this.
// fileprivate Don't let anything outside the current file use this.
// public Let anyone, anywhere use this

// private(set)   you can read it but cannot change it
// If you use private access control for one or more properties, chances are you’ll need to create your own initializer.

// attach properties or the methods to the struct itself

struct School {
    static var studentCount = 0
    
    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}
// static means both the studentCount property and add() method belong to the School struct itself, rather than to individual instances of the struct.

School.add(student: "Taylor Swift")
print(School.studentCount)

// you can't reach non-static method/property from static data

// self: the current value of a struct
// Self: the current type of struct

struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

struct Employee {
    let username: String
    let password: String
    
    static let example = Employee(username: "cfederighi", password: "h4ifaioph")
}

