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

var game = GameDesk()
game.setChessman(chess: rook, coordinates: ("A",8))
rook.coordinates
game.setChessman(chess: rook, coordinates: ("H",5))
rook.coordinates
