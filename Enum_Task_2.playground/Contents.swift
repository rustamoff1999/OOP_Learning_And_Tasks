import UIKit

enum Color {        //Contains two possible colors of chessman
    case white
    case black
}
enum Chessmen {
    case rook(nameInRus: String,color: Color)
    case knight(nameInRus: String,color: Color)
    case bishop(nameInRus: String,color: Color)
    case queen(nameInRus: String,color: Color)
    case king(nameInRus: String,color: Color)
    case pawn(nameInRus: String,color: Color)
}

let chessman : Chessmen
chessman = .pawn(nameInRus:"Пешка",color: .black)

let chessman2 = Chessmen.knight(nameInRus: "Конь", color: .white)
let chessman3 = Chessmen.bishop(nameInRus: "Слон", color: .black)
