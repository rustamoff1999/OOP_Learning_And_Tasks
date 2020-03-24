import UIKit

//:**init(rawValue:)**

enum Chessmen {
    
    enum Color : String {
        case white = "Белый",black = "Чёрный"
    }
    case rook(nameInRus: String,color: Color)
    case knight(nameInRus: String,color: Color)
    case bishop(nameInRus: String,color: Color)
    case queen(nameInRus: String,color: Color)
    case king(nameInRus: String,color: Color)
    case pawn(nameInRus: String,color: Color)
}

var chessman : Chessmen
chessman = .rook(nameInRus : "Ладья",color : .white)

switch chessman {
    case .knight(let nameInRus, let colorInRus):
        print("Name In Russian: \(nameInRus), Color In Russian: \(colorInRus.rawValue)")
    case .rook(let nameInRus, let colorInRus):
        print("Name In Russian: \(nameInRus), Color In Russian: \(colorInRus.rawValue)")
    case .king(let nameInRus, let colorInRus):
        print("Name In Russian: \(nameInRus), Color In Russian: \(colorInRus.rawValue)")
    default:
        print("Chessman is killed")
}

let anotherChessman : Chessmen
anotherChessman = .pawn(nameInRus: "Пешка", color: .black)

switch anotherChessman {
    case .king(let nameInRus,let ColorInRus):
        print("Name in Russian : \(nameInRus), Color in Russian : \(ColorInRus.rawValue)")
    case .pawn(let nameInRus,let ColorInRus):
        print("Name in Russian : \(nameInRus), Color in Russian : \(ColorInRus.rawValue)")
    default:
        print("Chessman is killed")
}
