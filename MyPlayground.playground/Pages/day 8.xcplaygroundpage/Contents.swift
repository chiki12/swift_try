import Cocoa

func printTimesTables(for number: Int, end: Int = 12){
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)
printTimesTables(for: 8)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: true)
print(characters.count)

enum PasswordError: Error {
    case short, obvious
}

// with throws you can throw error, but you dont have to throw errors. it might not throw error
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 { throw PasswordError.short}
    if password == "12345" { throw PasswordError.obvious}
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

//1. Starting a block of work that might throw errors, using do.
//2. Calling one or more throwing functions, using try.
//3. Handling any thrown errors using catch.
let string = "12345"
do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage")
} catch {
    print("There was an error: \(error.localizedDescription)")
}

// another version
//let result = try! checkPassword(string)
//// use ! only if you’re absolutely sure an error cannot be thrown.
//print("Password rating: \(result)")
