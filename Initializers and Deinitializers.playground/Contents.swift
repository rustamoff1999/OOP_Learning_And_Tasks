import UIKit

//:**convenience init()**

class Quadruped {
    var type = ""
    var name = ""
    func walk() {
        print("walk")
    }
}

class Dog : Quadruped {
    override init() {
        super.init()
        self.type = "Dog"
    }
    convenience init(text: String) {//:*Convinience init()*
        self.init()
        print(text)
    }
    func bark() {
        print("bark")
    }
}

class NoisyDog : Dog {
    override func bark() {
        for _ in 1...3 {
            super.bark
        }
    }
}
var someDog = Dog(text: "Object of class Dog created")

// ///////////////////////////////////////////////////////
//:**Failable initializers**

class Rectangle {
    var height : Int
    var weight : Int
    init?(height h: Int,weight w:Int) {
        self.height = h
        self.weight = w
        if !(h>0 && w>0) {
            return nil
        }
    }
}

var figure = Rectangle(height: 5, weight: -1)//returns nil

//:*Failable Initializers in Enums*

enum TempertureUnit {
    case Kelvin,Celsius,Fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}
let fahrenheit = TempertureUnit(symbol: "F")

enum TemperatureUnit2 : String {
    case Kelvin = "K",Celsius = "C",Fahrenheit = "F"
}
var celsius : TemperatureUnit2?
celsius = TemperatureUnit2.init(rawValue: "C")
celsius!.hashValue

// /////////////////////////////////////////
//:**Required init()**
//required init(paramethers) {
//body
//}

// /////////////////////////////////////////
print()
//: **Deinitializers**

class SuperClass {
    init?(isNill: Bool) {
        if isNill == true {
            return nil
        }
        else {
            print("object created")
        }
    }
    deinit {
        print("SuperClass deinitializer")
    }
}
class SubClass: SuperClass {
    deinit {
        print("SubClass deinitializer")
    }
}

var obj = SubClass(isNill: false)
obj = nil
