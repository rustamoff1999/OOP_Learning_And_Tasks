import UIKit

class Chessmen {
    
    enum Color {
        case black,white
    }
    enum FigureType {
        case rook,knight,bishop,queen,king,pawn
    }
    
    let figure : FigureType         //property
    let color : Color
    var coordinates: (String,Int)? = nil
    let figureSymbol : Character
    
    init(figure: FigureType, color: Color, figureSymbol : Character, coordinates: (String,Int)) {  //first init
        self.figure = figure
        self.color = color
        self.figureSymbol = figureSymbol
        self.setCoordinates(char: coordinates.0, num: coordinates.1)
    }
    
    init(figure: FigureType, color: Color, figureSymbol : Character) {      //second init
        self.figure = figure
        self.color = color
        self.figureSymbol = figureSymbol
    }
    
    func setCoordinates(char c: String, num n: Int) {      //method for putting the figure on the chess desk
        self.coordinates = (c,n)
    }
    
    func kill() {                                       //method for killing the figure
        self.coordinates = nil
    }
}
//:**Using subscript**
class ChessBoard {
    var desk : [Int: [String : Chessmen]] = [:]
    
    init() {
        for i in 1...8 {
            desk[i] = [:]
        }
    }
    var lettersArray = Array(arrayLiteral: "A","B","C","D","E","F","G","H")//we will use this property in printDesk() function
    //::**Subscript**
    subscript(alpha: String,num: Int) -> Chessmen? {
        get {
            return desk[num]![alpha]
        }
        set {
            if let figure = newValue {
                self.setChessman(figure: figure, coordinates: (num,alpha))
            }
            else {
                self.desk[num]![alpha]!.kill()//:**Added this. Now our figure also have removed from the Chessboard**
                self.desk[num]![alpha] = nil
            }
        }
    }
    
    func setChessman(figure: Chessmen, coordinates: (Int,String)) {
        let rowRange : ClosedRange<Int> = 1...8
        let colRange : ClosedRange<String> = "A"..."H"
        
        if rowRange.contains(coordinates.0) && colRange.contains(coordinates.1) {
            self.desk[coordinates.0]![coordinates.1] = figure
            figure.setCoordinates(char: coordinates.1, num: coordinates.0)
        }
            
        else {
            print("Coordinates out of range!")
        }
    }
    //Printing Chessboard
    func printDesk() {
        for i in 1...8 {
            print(i,terminator:" ")
            for j in self.lettersArray {
                if let chessman = self.desk[i]![j] {
                    print(chessman.figureSymbol,terminator:" ")
                }
                else {
                    print("_",terminator:" ")
                }
            }
            print()
        }
        print("  A B C D E F G H")
    }
}

var blackQueen = Chessmen(figure: .queen, color: .black, figureSymbol: "\u{265B}")
var whiteBishop = Chessmen(figure: .bishop, color: .white, figureSymbol: "\u{2657}")
var whiteKing = Chessmen(figure: .king, color: .white, figureSymbol: "\u{2654}")
var blackKnight = Chessmen(figure: .knight, color: .black, figureSymbol: "\u{265E}")
var whitePawn = Chessmen(figure: .pawn, color: .white, figureSymbol: "\u{2659}")
var whiteRook = Chessmen(figure: .rook, color: .white, figureSymbol: "\u{2656}")

var game = ChessBoard()
game["C",4] = blackQueen
game["C",4] = nil
game["C",4]
blackQueen.coordinates

game["C",4] = blackQueen
game["A",3] = whiteBishop
game["H",7] = whiteKing
game["F",5] = blackKnight
game["G",2] = whitePawn
game["B",1] = whiteRook
game.printDesk()//  1 _ ♖ _ _ _ _ _ _
                //  2 _ _ _ _ _ _ ♙ _
                //  3 ♗ _ _ _ _ _ _ _
                //  4 _ _ ♛ _ _ _ _ _
                //  5 _ _ _ _ _ ♞ _ _
                //  6 _ _ _ _ _ _ _ _
                //  7 _ _ _ _ _ _ _ ♔
                //  8 _ _ _ _ _ _ _ _
                //    A B C D E F G H

