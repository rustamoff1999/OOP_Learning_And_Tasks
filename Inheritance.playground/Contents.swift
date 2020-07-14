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

var dog = Dog()
dog.type = "dog"
dog.name = "Mike"
dog.walk()
dog.bark()
print()
dog.owner
dog.type
dog.name
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

//:*You can also create an array type of SuperClass and add elements type of SubClass*
var animalsArray : [Quadruped] = []
var someAnimal = Quadruped()
var myDog = Dog()
var sadDog = NoisyDog()

animalsArray.append(someAnimal)
animalsArray.append(myDog)
animalsArray.append(sadDog)
print("Working with operators is,as")
//:**operator is**
for item in animalsArray {
    if item is Dog {
        print("Yes")
    }
}
//:**operator as(as? as!)**

for item in animalsArray {
    print()
    if let animal = item as? Dog {
        animal.bark()
    }
    else if let animal = item as? NoisyDog {
        animal.bark()
    }
    else {
        item.walk()
    }
}
