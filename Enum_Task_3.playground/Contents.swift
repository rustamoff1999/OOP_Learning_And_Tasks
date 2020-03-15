import UIKit
//:**Nested enum**
enum Chessmen {
    
    enum Color {
        case white,black
    }
    case rook(nameInRus: String,color: Color)
    case knight(nameInRus: String,color: Color)
    case bishop(nameInRus: String,color: Color)
    case queen(nameInRus: String,color: Color)
    case king(nameInRus: String,color: Color)
    case pawn(nameInRus: String,color: Color)
}

let chessmanColor : Chessmen.Color
chessmanColor = .black

let chessman = Chessmen.bishop(nameInRus: "Слон", color: .white)

let anotherChessman = Chessmen.rook(nameInRus:"Ладья",color:.black)
var color = Chessmen.Color.white
var otherColor = Chessmen.Color.black

switch anotherChessman {
    case .rook(let nameInRus, let color):
        print("Chessman : Rook,name in russian: \(nameInRus),color: \(color)")
    case let .knight(nameInRus,color):
        print("Chessman : Knight, name in russian: \(nameInRus),color: \(color)")
    case .king(let nameInRus, let color):
        print("Chessman : King,name in russian: \(nameInRus),color: \(color)")
    default:
        print("Chessman is killed")
}

