import Cocoa

protocol Building {
    var numberRooms: Int { get }
    var cost: Int { get set }
    var estateAgent: String { get set }
    func summary()
}

extension Building {
    func summary() {
        print("\(estateAgent) is selling this building with \(numberRooms) of rooms for \(cost) dollars.")
    }
}

struct House {
    var numberRooms = 0
    var cost = 0
    var estateAgent = "Anonymous"
    func summary() {
        print("\(estateAgent) is selling this House with \(numberRooms) rooms for \(cost) dollars.")
    }
}

struct Office {
    var numberRooms = 0
    var cost = 0
    var estateAgent = "Anonymous"
    func summary() {
        print("\(estateAgent) is selling this Office with \(numberRooms) rooms for \(cost) dollars.")
    }
}

let house = House(numberRooms: 4, cost: 1000, estateAgent: "Chiki")
house.summary()


// start by desining the protocol fully before you go near any structs
