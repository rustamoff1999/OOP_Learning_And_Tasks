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

