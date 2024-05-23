import Cocoa

func greetUser() {
    print("Hi there!")
}

greetUser()
//var greetCopy = greetUser
//greetCopy()

let sayHello = { (name: String) -> String in
    "Hi \(name)"
}


var greetCopy: () -> Void = greetUser

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}
// at least the inputs are two string and the output is Bool then it can be used for sorted function

//let captainFirstTeam = team.sorted(by: captainFirstSorted)
//print(captainFirstTeam)

let captainFirstTeam = team.sorted(by: {(name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true // means "Suzanne" should come before
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
})
// so actually we dont need to specify the types of the two parameters because they must be strings, and we dont need to specify a return type because it must be a boolean

print(captainFirstTeam)
// closures cannot use external parameter labels
// we dont use parameter names when using a closure

//let sorted = team.sorted { a,b in
//    if a == "Suzanne" {
//        return true
//    } else if b == "Suzanne" {
//        return false
//    }
//    return a < b
//}
//print(sorted)

let sorted = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    return $0 < $1
}

print(sorted)

//let reverseTeam = team.sorted {
//    return $0 > $1
//}

// shorthand syntax
let reverseTeam = team.sorted { $0 > $1}
print(reverseTeam)

// dont use shorhand syntax under those circumstances:
// the closure's code is long
// $0 and friends are used more than once each
// you get three or more parameters

let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

// if you use map like this you dont need to return the same type as the input
let uppercaseTeam = team.map { $0.uppercased()}
print(uppercaseTeam)

// how to accept functions as parameters (particular important!!)

func makeArray(size: Int, using generator: ()-> Int) -> [Int] {
    var numbers = [Int]()
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    return numbers
}

let rolls = makeArray(size: 5) {
    Int.random(in: 1...20)
}

print(rolls)

func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let newRolls = makeArray(size:50, using: generateNumber)
print(newRolls)

func doImportantWork(first: ()-> Void, second: () -> Void, third: ()-> Void){
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}
