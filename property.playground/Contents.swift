import UIKit

class AboutMan {
    var name = "Имя"
    var surname = "Фамилия"
    lazy var wholeName = self.generateWholeName()   //lazy property     lazy-by-need
    
    lazy var wholeName2 : () -> String = {                            //lazy-by-name
        self.name + " " + self.surname
    }
    
    var wholeName3 : String {return self.name + " " + self.surname}   //computed property
    
    init(firstName:String,secondName:String) {
        (name,surname) = (firstName,secondName)
    }
    
    func generateWholeName()->String {
        return self.name + " " + self.surname
    }
}

var me = AboutMan(firstName: "Fuad", secondName: "Rustamov")
me.wholeName

me.name = "Mahmood"
me.wholeName
me.wholeName2()
me.name = "Cristiano"
me.wholeName

me.wholeName2()

me.name = "Fuad"
me.wholeName3
me.name = "Mahmood"
me.wholeName2()
me.wholeName
me.name = "Fuad"
me.wholeName3

//: **Getter and Setter**


struct Circle {
    var radius : Float
    var coordinates : (x: Int, y: Int)
    var length : Float {
        get {
            return 2.0 * Float.pi * self.radius
        }
        set {
            self.radius = newValue / (2.0 * Float.pi)
        }
    }
    
}

var myNewCircle = Circle(radius: 5.0, coordinates: (x:0, y:0))
myNewCircle.length          //getter

myNewCircle.length = 62.8   //setter

myNewCircle.radius

// //////////////////////////////////////////

//:**Observers**

//:*willSet and didSet*

struct Square {
    var lengthOfSide : Float {
        willSet {
            print("We establish a new value instead of the current value of the <<lenghtOfSide>> : We establish \(newValue) instead of \(self.lengthOfSide)")
        }
        didSet {
            print("We have established a new value instead of the old value of the <<lengthOfSide>> : We have established \(self.lengthOfSide) instead of \(oldValue)")
        }
    }
    var perimether : Float {
        get {
            return 4 * lengthOfSide
        }
        set {
            lengthOfSide = newValue / 4.0
        }
    }
}

var newSquare = Square(lengthOfSide: 3.0)
newSquare.perimether             //getter

newSquare.perimether = 10        //setter
print("\n")
newSquare.lengthOfSide = 20

newSquare.perimether


//Another example

struct Rectangle {
    var aSideLength : Float {
        willSet {
            print("We are establishing \(newValue) instead of \(self.aSideLength)")
        }
        didSet {
            print("We have established \(self.aSideLength) instead of \(oldValue)")
        }
    }
    
    var bSideLength : Float {
        willSet {
                  print("We are establishing \(newValue) instead of \(self.bSideLength)")
        }
        didSet {
                  print("We have established \(self.bSideLength) instead of \(oldValue)")
        }
    }
    
    var perimether : Float {
        return 2 * (self.aSideLength + self.bSideLength)
    }
}

print("\n")
var myRectangle = Rectangle(aSideLength: 5.0, bSideLength: 3.0)
myRectangle.perimether
myRectangle.aSideLength = 12.0
myRectangle.perimether

// ////////////////////////////////////////////////////////////////////////

//:**Static**

struct AudioChannel {
    static var maxVolume = 5
    var volume : Int {
        didSet {
            if self.volume > AudioChannel.maxVolume {
                self.volume = 5
            }
        }
    }
}

var leftChannel = AudioChannel(volume: 2)
var rightChannel = AudioChannel(volume: 3)
leftChannel.volume = 6
leftChannel.volume

AudioChannel.maxVolume = 10
AudioChannel.maxVolume

rightChannel.volume = 8
leftChannel.volume = 7
leftChannel.volume

//Another Example

struct Vehicle {
    static var maxWheels = 4
    var wheels : Int {
        didSet {
            if self.wheels > Vehicle.maxWheels {
                self.wheels = 4
            }
        }
    }
}
var motorcycle = Vehicle(wheels: 2)

var automobile = Vehicle(wheels: 4)
automobile.wheels = 6
automobile.wheels

Vehicle.maxWheels = 8
Vehicle.maxWheels

automobile.wheels = 6
automobile.wheels
