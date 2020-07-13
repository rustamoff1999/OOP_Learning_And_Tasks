import UIKit

//:**Inheritance**

//SuperClass
class Quadruped {
    var type = ""
    var name = ""
    func walk()->() {
        print("Walk")
    }
}
//Subclass
class Dog : Quadruped {
    func bark() {
        print("Woof")
    }
    func namePrint() {
        print(self.name)
    }
}

var dog = Dog()
dog.type = "dog"
dog.name = "Mike"
dog.walk()
dog.bark()
dog.namePrint()
print()
//:*super*

class NoisyDog : Dog {
    override func bark() {
        //print("woof")
        //print("woof")
        //print("woof")
        for _ in 1...3 {
            super.bark()
        }
    }
}

var badDog = NoisyDog()
badDog.bark()
