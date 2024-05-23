import Cocoa

class Animal {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    var name: String = "Anonymous"
    func speak(){
        print("im a dog and my name is \(name)")
    }
    init(name: String) {
        self.name = name
        super.init(legs: 4)
    }
}

final class Corgi: Dog {
    override func speak(){
        print("im a corgi and my name is \(name)")
    }
}

final class Poodle: Dog {
    override func speak(){
        print("im a poodle and my name is \(name)")
    }
}

class Cat: Animal {
    var name: String = "Anonymous"
    var isTame: Bool
    func speak(){
        print("im a cat and my name is \(name)")
    }
    init(isTame: Bool, name: String) {
        self.name = name
        self.isTame = isTame
        super.init(legs: 4)
    }
}

final class Persian: Cat {
    override func speak() {
        print("i'm a persian and my name is \(name)")
    }
}

final class Lion: Cat {
    override func speak() {
        print("i'm a lion and my name is \(name)")
    }
}


let lion = Lion(isTame: true, name: "lionking")
lion.speak()

let poodle = Poodle(name: "poodle")
poodle.speak()
