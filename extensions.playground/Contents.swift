import UIKit
import Foundation//for sqrt and pow

struct Line {
    var pointOne : (Double,Double)
    var pointTwo : (Double, Double)
}

extension Double {
    var km : Double {return self * 1000}//:**computational properties in extensions**
    var m : Double {return self }
    var cm : Double {return self / 100}
    var mm : Double {return self / 1000}
    var ft : Double {return self / 3.28084}
    
    init(line: Line) {//:**Initializer in extension**
        self = sqrt(pow(line.pointTwo.0 - line.pointOne.0,2) + pow(line.pointTwo.1 - line.pointOne.1,2))
    }
}
let oneKm = 1.km
print("There are \(oneKm) meters in one kilometer")
let oneCm = 1.cm
print("There are \(oneCm) meters in one cm")
var lineOnFlat = Line(pointOne: (10,10), pointTwo: (14,10))

var lineLength = Double(line: lineOnFlat)//4
//:**Method in extension**
extension Int {
    func repetition(task: ()->()) {
        for _ in 1...self {
            task()
        }
    }
}
3.repetition{
    print("I learn Swift!")
}

extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
someInt.square()//:*9*
//:**Subscript in extension**

extension Int {
    subscript(digit : Int) -> Int {//returning of any digit of number
        var num = self
        var i = 1
        while i < digit {
            num = num / 10
            i += 1
        }
        return num%10
    }
}

123456[10]
