import UIKit

extension Int {
    var asDouble : Double {return Double(self)}
    var asFloat : Float {return Float(self)}
    var asString : String {return String(self)}
}
var someDouble = 5.asDouble
type(of: someDouble)//Double.Type
