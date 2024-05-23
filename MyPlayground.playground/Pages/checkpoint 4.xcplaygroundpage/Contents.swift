
import Cocoa

enum ISRError: Error {
    case outOfBounds, noRoot
}


func getIntegerSquareRoot(_ number: Int) throws -> Int {
    if (number < 0 || number > 100) {
        throw ISRError.outOfBounds
    } else {
        for i in 1...number {
            if (i*i == number) {
                return i
            }
            if (i*i > number) {
                throw ISRError.noRoot
            }
        }
        throw ISRError.noRoot
    }
}

let a = 4

do {
    let result = try getIntegerSquareRoot(a)
    print("The square root of the input number is \(result)")
} catch ISRError.outOfBounds {
    print("The input number is out of bounds.")
} catch ISRError.noRoot {
    print("There is no root for the input number.")
} catch {
    print("There is an unknown error.")
}
