import UIKit

var russianCurrency : String = "Rouble"

var currencyUnit: [String] = ["Rouble","Dollar","Euro"]
russianCurrency = currencyUnit[0]

//:**Enum**

enum CurrencyUnit {
    case rouble,dollar
    case euro
}

let roubleCurrency = CurrencyUnit.rouble    //first way

let dollarCurrency : CurrencyUnit   //second way
dollarCurrency = .dollar

// ////////////////////////////////////////////

//: *Associated paramethers*
enum CurrencyUnit2 {
    case rouble(countries:[String],shortName:String)
    case dollar(countries:[String],shortName:String)
    case euro(countrie:[String],shortName:String)
}
var roubleCurrency2 = CurrencyUnit2.rouble(countries:["Russia"], shortName: "RUB")
var dollarCurrency2 : CurrencyUnit2
dollarCurrency2 = .dollar(countries:["USA","Australia","Canada"], shortName:"USD")

enum DollarCountries {
    case usa
    case australia
    case canada
}

enum EuroCountries {
    case greece
    case belgium
    case italy
    case spain
}

enum DollarUnit {
    case dollar(countries: [String],shortName: String,national: DollarCountries)
}
enum EuroUnit {
    case euro(sountries:[String],shortName:String,national: EuroCountries )
}
let usdCurrency = DollarUnit.dollar(countries: ["USA","Australia","Canada"], shortName: "USD", national: .australia)
let euroCurrency = EuroUnit.euro(sountries: ["Greece","Belgium","Italy","Spain"], shortName: "Default", national: .italy)

// /////////////////////////////////////////////////////////

//: *Nested enum*

enum Currency {         //data type "Currency"
    enum EuroCountries {    //Countries that use Euro
        case italy
        case spain
        case greece
        case belgium
    }
    case euro(countries:[String],shortName:String,national: EuroCountries)
    case dollar(countries:[String],shortName:String)
    case rouble(countries:[String],shortName:String)
}
let someVar : Currency
someVar = .euro(countries:["Belgium","Spain","Italy","Greece"],shortName:"Default",national: .greece)

let anotherVar = Currency.euro(countries: ["Belgium","Spain","Italy","Greece"], shortName: "Default", national: .belgium)
let someConst : Currency.EuroCountries
someConst = .italy

let anotherConst : Currency
anotherConst = .euro(countries:["Belgium","Spain","Italy","Greece"],shortName:"Default",national:.spain)
let variable : Currency.EuroCountries
variable = .spain
// ///////////////////////////////////////////////////////////
//: *Switch for enum*
var euroUnit : Currency
euroUnit = .euro(countries: ["Italy","Spain","Belgium","Greece"], shortName: "Default", national: .italy)

switch euroUnit {
    case .rouble(let countries,let shortName):
        print("It's Rouble. Countries : \(countries), shortname : \(shortName)")
    case let .dollar(countries,shortName):
        print("It's Dollar. Countries : \(countries), shortname: \(shortName)")
    case .euro(let countries,let shortName,let national):
        print("It's Euro \(national). Countries: \(countries), shortname: \(shortName)")
}
//  /////////////////////////////////////////////////////////

//:**Related Values of Enumeration Members**

enum Smile : String {
    case joy = ":)"
    case laugh = ":D"
    case sorrow = ":("
    case surprise = "o_O"
}

enum Planet : Int {
    case mercury = 1, venus,earth,mars,jupiter,saturn,uranus,neptune,    // venus = 2,earth = 3,mars = 4......
                      pluton = 999
}

let iAmHappy = Smile.joy
var joy : String = iAmHappy.rawValue

let ourPlanet : Planet
ourPlanet = .earth
var ourPlanetInCount = Planet.earth.rawValue

let iAmSorrow : Smile
let howILook : String = Smile.sorrow.rawValue

var theMostFarPlanet : Planet
theMostFarPlanet = .pluton
let plutonInCount = Planet.pluton.rawValue

//:**init(rawValue:)**

var myPlanet = Planet.init(rawValue: 3) //earth

var anotherPlanet = Planet.init(rawValue: 11) //nil
let pluton = Planet.init(rawValue: 999) //pluton

let me = Smile.init(rawValue: ":D")
let you = Smile.init(rawValue:":(")

enum Garage : String {
    case myCar = "Bmw"
    case fathersCar = "Mercedes"
    case mothersCar = "KIA"
}

let iChoose = Garage.init(rawValue:"Bmw")
let fatherChooses = Garage.init(rawValue:"Mercedes")
let motherChooses = Garage.init(rawValue:"KIA")

// ////////////////////////////////////

//:**Properties**

enum Emoji: String {
    case thumbsUp = "\u{1F44D}"
    case thumdsDown = "\u{1F44E}"
    case applause = "\u{1F44F}"
    case ok = "\u{1F44C}"
    var description : String {return self.rawValue}
}

let myReaction : Emoji
myReaction = .applause
myReaction.description

//Another example
enum Cars: String {
    case bmw = "X3"
    case mercedes = "GLS500"
    case audi = "A7"
    var model : String {return self.rawValue}
}

let buyACar  = Cars.audi
buyACar.model

// ///////////////////////////////////////

//:**Methods**

enum Mobile : String {
    case iphone = "X"
    case samsung = "Galaxy A7"
    var description : String {return self.rawValue}     //property
    func about() -> () {        //method
        if self.rawValue == "X" {
            print("Buy this phone")
        }
        else if self.rawValue == "Galaxy A7" {
            print("Don't buy this phone")
        }
    }
}

let myPhone = Mobile.iphone
myPhone.description//property
myPhone.about()

var yourPhone = Mobile.samsung
yourPhone.about()

// ///////////////////////////////////////

//: **Operator Self**

enum Teams : Int {
    case realMadrid = 13
    case barcelona = 5
    case liverpool = 6
    case milan = 8
    
    var clCount : Int {
        return self.rawValue
    }
    func team() -> Teams {
        return self
    }
    func teamPower() -> Int {
        return self.rawValue
    }
    func teamAnalyzing() -> () {
        switch self.rawValue {
            case 13:
                print("This team is amazing!")
            case  8:
                print("This team is good")
            case 6:
                print("This team is not bad")
            default:
                print("This team is not so good")
        }
    }
}
var myTeam : Teams = .realMadrid
myTeam.clCount
myTeam.teamPower()
myTeam.team()

myTeam.teamAnalyzing()

let yourTeam = Teams.init(rawValue: 13)
let elClasicoOpponent = Teams.init(rawValue:5)

// ///////////////////////////////////////////

//: **Recursive Enum**

enum ArithmeticExpression {
    case addition(Int,Int)      //Associated paramethers
    case substraction(Int,Int)  //Associated paramethers
    
    func evaluation() -> Int {
        switch self {
        case .addition(let first,let second):
            return first + second
        case let .substraction(first,second):
            return first - second
        }
    }
}

var expr = ArithmeticExpression.addition(10,14)
print(expr.evaluation())

enum Calculator {
    case number(Int)
    indirect case addition(Calculator,Calculator)
    indirect case substraction(Calculator,Calculator)
    indirect case multiplication(Calculator,Calculator)
    indirect case division(Calculator,Calculator)
    indirect case power(Calculator,Calculator)
    
    func evaluation(_ expression: Calculator?? = nil) -> Int {
        switch expression ?? self {
            case .number(let number):
                return number
            case let .addition(first,second):
                return self.evaluation(first) + self.evaluation(second)
            case let .substraction(first,second):
                return self.evaluation(first) - self.evaluation(second)
            case let .multiplication(first,second):
                return self.evaluation(first) * self.evaluation(second)
            case let .division(first,second):
                return self.evaluation(first) / self.evaluation(second)
            case let .power(first,second):
                return Int(NSDecimalNumber(decimal: (pow(Decimal(self.evaluation(first)),self.evaluation(second)))))
            default:
                return 0
        }
    }
}
var hardExpr = Calculator.addition(.number(20),.substraction(.number(10),.number(34)))
hardExpr.evaluation()

var powExpr = Calculator.power(.number(3),.number(3))
powExpr.evaluation()

var multExpr = Calculator.multiplication(.number(3),.number(3))
multExpr.evaluation()
