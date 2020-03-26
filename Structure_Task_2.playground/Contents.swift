import UIKit

enum Color : String {
    case black = "Чёрный"
    case white = "Белый"
}

enum ChessFigures : String {
    case rook = "Ладья"
    case knight = "Конь"
    case bishop = "Слон"
    case queen = "Королева"
    case king = "Король"
    case pawn = "Пешка"
}

struct Chessmen {
    var figure : ChessFigures
    var color : Color
    var coordinates : (String,UInt)? = nil
    
    init(figureName: ChessFigures, colorOfFigure: Color) {
        self.figure = figureName
        self.color = colorOfFigure
    }
    
    mutating func setCoordinates(char: String, num: UInt) {
        self.coordinates = (char,num)
    }
    mutating func kill() {
        self.coordinates = nil
    }
}

var whiteBishop = Chessmen(figureName: .bishop, colorOfFigure: .white)

whiteBishop.setCoordinates(char:"A", num:1)

whiteBishop.kill()
