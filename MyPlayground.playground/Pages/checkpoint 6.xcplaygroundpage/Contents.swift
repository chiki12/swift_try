import Cocoa

struct Car {
    let model: String
    let seats: Int
    private(set) var gear: Int = 1
    init(model: String, seats: Int){
        self.model = model
        self.seats = seats
    }
    mutating func gearUp() -> Bool {
        if gear + 1 > 10 {
            return false
        } else {
            gear += 1
            return true
        }
    }
    mutating func gearDown() -> Bool {
        if gear - 1 < 1 {
            return false
        } else {
            gear -= 1
            return true
        }
    }
}
