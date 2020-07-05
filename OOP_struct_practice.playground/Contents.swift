//Struct

var playerInChess = (name: "Vasiliy", wins: 10)

struct PlayerInChess {
    var name : String = "Игрок"
    var wins : UInt = 0
    init(wins: UInt) {
        self.wins = wins
    }
    func describePlayer() -> () {
        print("Player \(self.name) has \(self.wins) wins")
    }
    
    mutating func playerWins(_ count: UInt = 1) {
        self.wins += count
    }
}

var anthony  = PlayerInChess(wins: 20)
anthony.wins += 1
anthony.name = "Anthony"

var anthonyAdams = anthony
anthonyAdams.wins = 10

var michaelJordan = PlayerInChess(wins: 225)
michaelJordan.name = "Michael Jordan"
michaelJordan.describePlayer()

michaelJordan.playerWins()
michaelJordan.wins

michaelJordan.playerWins(12)
michaelJordan.wins

//Task

enum Color : String {
    case white = "Белый", black = "Чёрный"
}

enum ChessFigures : String {
    case knight = "Конь", bishop = "Слон", queen = "Ферзь", king = "Король", pawn = "Пешка", rook = "Ладья"
}

struct Chessmen {
    let color : Color
    var figure : ChessFigures
    var coordinates : (String, UInt)? = nil
    
    init(figure: ChessFigures, color: Color) {
        self.figure = figure
        self.color = color
    }
    
    mutating func setCoordinates(char: String, num: UInt) {
        self.coordinates = (char,num)
    }
    
    mutating func kill() -> () {
        self.coordinates = nil
    }
}

var whiteBishop = Chessmen(figure: .bishop, color: .white)
whiteBishop.setCoordinates(char: "A", num: 1)
whiteBishop.kill()










