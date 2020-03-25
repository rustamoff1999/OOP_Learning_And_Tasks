import UIKit

//:**Recursive Enum**

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
