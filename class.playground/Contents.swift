import UIKit

//: **Class**

//:**Properties** and **Methods**

enum Color {
    case black,white
}

enum FigureType {
    case rook,knight,bishop,queen,king,pawn
}

class Chessmen {
    let figure : FigureType         //property
    let color : Color
    var coordinates: (String,UInt)? = nil
    let figureSymbol : Character
    
    init(figure: FigureType, color: Color, figureSymbol : Character) {
        self.figure = figure
        self.color = color
        self.figureSymbol = figureSymbol
    }
    
    func setCoordinates(char c: String, num n: UInt) {      //method for putting the figure on the chess desk
        self.coordinates = (c,n)
    }
    
    func kill() {                                       //method for killing the figure
        self.coordinates = nil
    }
}
//Creating an instances
var whiteRook = Chessmen(figure: .rook, color: .white, figureSymbol: "\u{265C}")
whiteRook.coordinates = ("G",4)

var blackQueen = Chessmen(figure: .queen, color: .black, figureSymbol: "\u{2655}")
blackQueen.setCoordinates(char: "B", num: 3)

var whiteBishop = Chessmen(figure: .bishop, color: .white, figureSymbol: "\u{2657}")
whiteBishop.setCoordinates(char: "C", num: 7)
whiteBishop.kill()


