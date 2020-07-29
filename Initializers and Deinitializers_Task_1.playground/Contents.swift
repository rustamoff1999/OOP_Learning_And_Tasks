import UIKit

enum DayOfWeek : Int {
    case monday = 1,tuesday,wednesday,thursday,friday,saturday,sunday
    init?(_ dayOfWeek: String){
        switch dayOfWeek {
        case "Monday":
            self = .monday
        case "Tuesday":
            self = .tuesday
        case "Wednesday":
            self = .wednesday
        case "Thursday":
            self = .thursday
        case "Friday":
            self = .friday
        case "Saturday":
            self = .saturday
        case "Sunday":
            self = .sunday
        default:
            return nil
        }
    }
}

var today = DayOfWeek("Wednesday")
today!.rawValue
