
import Cocoa

//difference between class and struct:
// you can make one class build upon functionality in another class
// swift wont generate a memberwise initializer for classes
// if you copy an instance of a class, both copies share the same data
// we can add a deinitializer to run when the final copy is destroyed
// constant class instances can have their variable properties changed

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

class Employee {
    let hours: Int
    init(hours: Int){
        self.hours = hours
    }
    func printSummary() {
        print("I work \(hours) a day")
    }
}

final class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I'm a developer whowill sometimes work \(hours) hours a day, but other times wil spend hours arguing about whether code hsould be indented using tabs or spaces")
    }
}

// final means nothing can herit this class (not heritable)
final class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}
let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)

robert.work()
joseph.work()

let novall = Developer(hours: 8)
novall.printSummary()

class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
//   super. allows us to call up to methods that belong to our parent class, such as its initializer.
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)

// If a subclass does not have any of its own initializers, it automatically inherits the initializers of its parent class.

class User {
    var username = "Anonymous"
    
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}
var user1 = User()
var user2 = user1.copy()
user2.username = "Taylor"

print(user1.username)
print(user2.username)

// deinitializer: dont use func; never take parameters or return data; it runs when the last copy of a class instance is destroyed; we never call deinitializers directly; structs dont have deinitializer bc its always unique

class User1 {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }
    
    deinit {
        print("User \(id): I'm dead!")
    }
}


var users = [User1]()

for i in 1...3{
    let user = User1(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}
print("Loop is finished!")
users.removeAll()
print("Array is clear!")


// sontant class, constant property: signpost that always points to the same user, who always has the same name
// constant class, variable property: signpost that always ppoints to the same, but they can change their name
// variable class, constant property: signpost that can point to different users, but their names never change
// variable class, variable property: signpost that can point to different users, and those users can also change their names

// for class, dont need to write mutating in front of function
