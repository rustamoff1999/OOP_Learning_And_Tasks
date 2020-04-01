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
}
var desk = ChessBoard()

var blackBishop = Chessmen(figure: .bishop, color: .black, figureSymbol: "\u{265D}", coordinates: ("C",8))
blackBishop.coordinates

desk.setChessman(figure: blackBishop, coordinates: (6,"B"))
blackBishop.coordinates

desk.setChessman(figure: blackBishop, coordinates: (1,"H"))
blackBishop.coordinates

desk["H",1]         //Not an empty position
desk["A",4]         //Empty position

desk["H",1]?.coordinates

desk["H",1] = Chessmen.init(figure: .queen, color: .white, figureSymbol: "\u{2655}", coordinates: ("H",1))
desk["H",1]

desk["H",1] = nil
desk["H",1]


