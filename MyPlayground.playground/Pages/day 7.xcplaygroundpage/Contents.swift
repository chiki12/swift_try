import Cocoa

func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversation")
}

func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) * \(number) is \(i * number)")
    }
}

printTimesTables(number: 5, end:  20)

func rollDice() -> Int {
    return Int.random(in: 1...6)
}


let result = rollDice()
print(result)

func areLettersIdentical(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted()
}
// no need write return when there is only one line in {}

areLettersIdentical(string1: "abc", string2: "cba")

func pythagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}
let c = pythagoras(a: 3, b: 4)
print(c)

// if your function doesnt return a value, you can still use return by itself to force the function to exit early

func getUser3() -> (firstName: String, lastName: String){
    (firstName: "Taylor", lastName: "Swift")
}

let user3 = getUser3()
print("Name: \(user3.firstName) \(user3.lastName)")

//Swift can't knw ahead of time if dictionary keys are present
// when you access tuple values, swift knows it will be there

let (firstName, lastName) = getUser3()
print("Name: \(firstName), \(lastName)")

// video "How to return multiple values from functions" are important

// really common in Swift that have the functions share same name so have to distinguish by parameters

func hireEmployee(name: String) { }
func hireEmployee(title: String) { }
func hireEmployee(location: String){ }

let lyric = "I see a red door and i want it painted black."
print(lyric.hasPrefix("I see"))

// two ways to customize parameter labels:
//_
//or
//argumentlabel and parameter name side by side
func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

//let string = "HELLO, WORLD"
//let result = isUppercase(string)

func printTimesTable(for number: Int) {
    for i in 1 ... 12 {
        print("\(i) * \(number) is \(i * number)")
    }
}

printTimesTable(for: 5)
