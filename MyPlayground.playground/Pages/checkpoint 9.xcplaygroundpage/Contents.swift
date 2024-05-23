
import Cocoa

var arr: [Int]? = nil
let number = arr?.randomElement() ?? Int.random(in: 1...100)
print(number)

func checkpoint(arr: [Int]?) -> Int {
    arr?.randomElement() ?? Int.random(in: 1...100)
}
checkpoint(arr: [6,8,9])
