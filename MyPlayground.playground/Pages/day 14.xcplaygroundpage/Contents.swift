import Cocoa

let opposites = ["Mario": "Wario", "Luigi": "Waluigi"]
let peachOpposite = opposites["Peach"]

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty")
}

var num1 = 1_000_000
var num2 = 0
var num3: Int? = nil

var str1 = "Hello"
var str2 = ""
var str3: String? = nil

var arr1 = [0]
var arr2 = [Int]()
var arr3: [Int]? = nil

func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil

//  temporarily creating a second constant of the same name, available only inside the condition’s body. This is called shadowing, and it’s mainly used with optional unwraps
if let number = number {
    // valid
    
    print(square(number: number))
    
    // valid
}


// How to unwrap optionals with guard
func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }
    print("\(number) x \(number) is \(number*number)")
}
/*
var myVar: Int? = 3
if let unwrapped = myVar {
    // Run if myVar has a value inside
}

guard let unwrapped = myVar else {
    // Run if myVar doesn't have a value inside
}
*/

// Swift requires you to use return if a guard check fails
// If the optinal you're unwrapping has a value, you can use it after the guard code finishes

// nil coalescing
let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

//let new = captains["Serenity"]
// new will be an optional string
let new = captains["Serenity"] ?? "N/A"
//this new won't be an optional string
// same as:
//let new = captains["Serenity", default: "N/A"]

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

let input = ""
let number1 = Int(input) ?? 0
print(number1)

// How to handle multiple optionals using optional chaining
let names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

// ?.func() means: If the optional has a value inside, unwrap it then...

//struct Book {
//    let title: String
//    let author: String?
//}

var book1: Book? = nil
let author1 = book1?.author?.first?.uppercased() ?? "A"
print(author1)

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}
// if you wnat to know what kind of error, then dont use try?


let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)

// try? main use in 3 places:
// 1. In combination with guard let to exit the current function if the try? call returns nil.
// 2. in combination with nil coalescing to attempt something or provide a default value on failure
// 3. When calling any throwing function without a return value, when you genuinely don’t care if it succeeded or not – maybe you’re writing to a log file or sending analytics to a server, for example

/*
 Summary: Optionals
 
` let us represent the absence of data
` everything that isn't optional definitely has a value inside
` unwrapping looks inside the optional: if there's a value it sent back
` if let runs code if the optinal has a value; guard let runs code if optinal doesnt have a value
` ?? unwraps and returns an optional's value, or a default value instead
` optional chaining reads an optional inside another optional
` try? can convert throwing functions so they return an optional
 */
 
