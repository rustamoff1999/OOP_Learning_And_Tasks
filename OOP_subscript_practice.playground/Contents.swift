import UIKit

class Chessman {
    enum Color {
        case white,black
    }
    enum FigureType {
        case pawn,rook,knight,bishop,queen,king
    }
    
    var color : Color
    var figureType : FigureType
    var coordinates : (String,Int)? = nil
    
    init(color: Color, figureType: FigureType) {
        self.color = color
        self.figureType = figureType
    }
    
    func setCoordinates(char c: String, num n: Int) {
        self.coordinates = (c,n)
    }
    func kill()->() {
        self.coordinates = nil
    }
}

class GameDesk {
    var desk : [Int: [String: Chessman]] = [:]
    init() {
        for i in 1...8 {
            desk[i] = [:]
        }
    }
    //:**Subscript**
    subscript(number: Int, alpha: String) -> Chessman? {
        get {
            return self.desk[number]![alpha]
        }
        set(newFigure) {
            if let chessman = newFigure {
                self.setChessman(chess: chessman, coordinates: (alpha,number))
            }
            else {
                self.desk[number]![alpha] = nil
            }
        }
    }
    func setChessman(chess: Chessman, coordinates: (String,Int)) {
        let rowRange = 1...8
        let colRange = "A...H"
        if rowRange.contains(coordinates.1) && colRange.contains(coordinates.0) {
            self.desk[coordinates.1]![coordinates.0] = chess
            chess.setCoordinates(char: coordinates.0, num: coordinates.1)
        }
        else {
            print("Coordinates out of range")
        }
    }
}
var rook = Chessman(color: .white, figureType: .rook)
var queen = Chessman(color: .black, figureType: .queen)


var game = GameDesk()
game.setChessman(chess: rook, coordinates: ("A",8))
rook.coordinates
game.setChessman(chess: rook, coordinates: ("H",5))
rook.coordinates
game[5,"H"]
game[5,"H"]!.coordinates

game[1,"B"] = queen
game[1,"B"] = nil
game[1,"B"]
