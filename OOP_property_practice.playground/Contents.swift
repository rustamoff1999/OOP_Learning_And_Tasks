import UIKit

class AboutMan {
    var name : String
    var surname : String
    lazy var wholeName : () -> String = {"\(self.name) \(self.surname)"}
    init(name: String,surname: String) {
        self.name = name
        self.surname = surname
    }
    
    func fullName() -> String {
        return self.name + " " + self.surname
    }
}

var oleg = AboutMan(name: "Oleg", surname: "Bistrov")

oleg.wholeName()
oleg.surname = "Maksimov"
oleg.wholeName() //Lazy-by-name

class AboutMan2 {
    var name : String
    var surname : String
    var wholeName : String {return self.name + " " + self.surname}
    
    init(name : String,surname:String) {
        self.name = name
        self.surname = surname
    }
}

var me = AboutMan2(name: "Fuad", surname: "Rustamov")
me.wholeName

//get,set

class Circle {
    var radius : Double
    let coordinates : (Double,Double)
    var length : Double {
        get {
            return 2 * Double.pi * self.radius
        }
        set {
            self.radius = newValue / (2 * Double.pi)
        }
    }
    init(radius: Double, coordinates: (Double,Double)) {
        self.radius = radius
        self.coordinates = coordinates
    }
}

var circle = Circle(radius: 5.0, coordinates: (0.0,0.0))

circle.length
circle.radius = 10
circle.length
circle.length = 31.41
circle.radius

//observers

class Circle2 {
    var radius : Double {
        willSet {
            print("Setting \(newValue) instead of \(self.radius)")
        }
        didSet {
            print("Have setted \(self.radius) instead of \(oldValue)")
        }
    }
    let coordinates : (Double,Double)
    var length : Double {
        get {
            return 2 * Double.pi * self.radius
        }
        set {
            self.radius = newValue / (2 * Double.pi)
        }
    }
    init(radius: Double, coordinates: (Double,Double)) {
        self.radius = radius
        self.coordinates = coordinates
    }
}

var circle2 = Circle2(radius: 3.0, coordinates: (0.0,0.0))
circle2.length
circle2.length = 32

struct AudioChannel {
    static var maxVolume = 5
    var volume : Int  {
        didSet {
            if self.volume > AudioChannel.maxVolume {
                self.volume = AudioChannel.maxVolume
            }
        }
    }
}

var leftChannel = AudioChannel(volume: 2)
var rightChannel = AudioChannel(volume: 3)
rightChannel.volume = 6
rightChannel.volume

AudioChannel.maxVolume = 10
rightChannel.volume = 8
rightChannel.volume



