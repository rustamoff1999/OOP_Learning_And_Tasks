import UIKit

//:**Any and AnyObject**

//:*Any*

var things = [Any]()
things.append(0.0)
things.append(10.0)
things.append("hello")
things.append(42)
things.append((3.0,5.0))
things.append({(name : String) -> String in
    return "Hello, \(name)"
})
//Any is not Hashable!

for item in things {
    switch item {
    case let someInt as Int:
        print("An Integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0.0:
        print("A positive double of value \(someDouble)")
    case let someDouble as Double where someDouble <= 0:
        print("A non positive double of value \(someDouble)")
    case let someString as String:
        print("A string value of \(someString)")
    case let (x,y) as (Double,Double):
        print("an (x,y) point at \(x), \(y)")
    case let stringConverter as (String)->String:
        print(stringConverter("Troll"))
    default:
        print("Something else")
    }
}
class Quadruped {
    var type = ""
    var name = ""
    func walk()->() {
        print("Walk")
    }
}
class Dog : Quadruped {
    var owner : String
    //override init()
    override init() {
        owner = "John"
        super.init()
        self.type = "dog"
    }
    func bark() {
        print("Woof")
    }
    func namePrint() {
        print(self.name)
    }
}
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
print("\nWorking with AnyObject: \n")
//:*AnyObject*
let someObjectArray : [AnyObject] = [Dog(),NoisyDog(),Dog()]

for object in someObjectArray {
    let animal = object as! Dog
    print(animal.type)
}
print()
//Short form
for object in someObjectArray as! [Dog] {
    print(object.type)
}

