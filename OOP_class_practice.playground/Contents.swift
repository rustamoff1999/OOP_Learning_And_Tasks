import UIKit


class Chessman {
    enum ChessmanType {
        case pawn,rook,knight,bishop,queen,king
    }

    enum ChessmanColor {
        case white,black
    }
    let color : ChessmanColor
    let type : ChessmanType
    var coordinates : (String,Int)? = nil
    let figureSymbol : Character
    init(color : ChessmanColor,type: ChessmanType,figure: Character) {
        self.color = color
        self.type = type
        self.figureSymbol = figure
    }
    
    init(color : ChessmanColor,type: ChessmanType,figure: Character, coordinates: (String,Int)) {
        self.color = color
        self.type = type
        self.figureSymbol = figure
        self.setCoordinates(char: coordinates.0, num: coordinates.1)
    }
    
    func setCoordinates(char c:String,num n:Int) {
        self.coordinates = (c,n)
    }
    func kill() {
        self.coordinates = nil
    }
}

var whiteKing = Chessman(color: .white, type: .king, figure: "\u{2654}")

whiteKing.setCoordinates(char: "A", num: 7)
whiteKing.kill()

var whiteColor = Chessman.ChessmanColor.white


