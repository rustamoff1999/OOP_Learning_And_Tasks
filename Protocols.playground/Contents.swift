import UIKit
//:**properties in protocol**
protocol SomeProtocol {
    var mustBeSettable : Int {get set}
    var doesNotBeSettable : Int {get}
}
//Type properties in protocols
protocol AnotherProtocol {
    static var someTypeProperty : Int {get set}
}

//example
protocol FullyNamed {
    var fullName : String {get}
}
struct Person : FullyNamed {
    var fullName: String
}
var john = Person(fullName: "John Wick")
john.fullName
// /////////////////////////////////////////////////
//:**Methods in protocols**
protocol RandomNumberGenerator {
    func random() -> Double
    static func randomString()
    mutating func changeValue(newValue: Double)
}
// ////////////////////////////////////////////////
//:**Initializers in protocols**
protocol Named {
    init(name: String)
}
class Human : Named {
    var name : String
    required init(name: String) {
        self.name = name
    }
}
var somePerson = Human(name: "Mark")
// ///////////////////////////////////////////////
//:**Extensions and Protocols**
protocol TextRepresentable {
    func asText() -> String
}
extension Int : TextRepresentable {
    func asText() -> String {
        return String(self)
    }
}
5.asText()
5 is TextRepresentable

//Now,let's extend this protocol
extension TextRepresentable {
    func description() -> String {
        return "This type conforms to protocol TextRepresentable"
    }
}
10.description()
// //////////////////////////////////////////////////////////////////

//:**Protocol inheritance**
protocol SuperProtocol {
    var someVar : Int {get}
}
protocol SubProtocol : class/*only classes can conform to this protocol (not structs or enums)*/, SuperProtocol {
    func someMethod()
}
class SomeClass : SubProtocol {
    var someVar: Int = 20
    func someMethod() {
        //code
    }
}
var someObject = SomeClass()
someObject.someVar

// /////////////////////////////////////////////
//:**Protocols composition**

protocol Name {
    var name : String {get}
}
protocol Age {
    var age : Int {get}
}
struct Person2 : Name,Age {
    var name: String
    var age : Int
}
func wishHappyBirthday(celebrator : Name & Age) {
    print("Happy Birthday \(celebrator.name)! You are \(celebrator.age) already!")
}
var johnWick = Person2(name: "John Wick", age: 46)
wishHappyBirthday(celebrator: johnWick)
