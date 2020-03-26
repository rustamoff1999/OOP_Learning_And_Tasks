import UIKit


var playerInChess: (name: String,wins: Int) = (name: "Vasiliy", wins: 10)

//: **Structure**

struct PlayerInChess {      //with properties "name" and "wins"
    let name : String
    var wins : UInt
}
var oleg : PlayerInChess
type(of:oleg)

struct Car {
    var model : String
    var year : UInt
}

struct Company {
    var ceo : String
    var name : String
    var year : UInt
}

//:**.Init(:)**

struct TennisPlayer {
    let name : String
    var wins : UInt = 0
    var country : String = "Default"
}

var federer = TennisPlayer(name: "Roger", wins: 343, country: "Switzerland")
var nadal = TennisPlayer(name:"Rafael",wins: 445, country: "Spain")

struct FootballPlayer {
    var club : String
    var country : String
    var name : String
}

var cristiano = FootballPlayer(club: "Juventus", country: "Portugal", name: "Critiano")
var messi = FootballPlayer(club: "Barcelona", country: "Argentina", name: "Lionel")

//:**Default value**

struct Game {
    var name : String = "Computer"
    var wins : UInt = 0
}

var me = Game.init(name: "Fuad", wins: 45)
var computer = Game()

me.name
me.wins
me.wins+=1
me.wins

cristiano.club = "Manchester United"
messi.name = "Leo"
federer.wins = 501
federer.wins

//:**Own initializer**

struct Teams {
    var name : String = "Computer"
    var wins : Int = 0
    
    init(name : String) {
        self.name = name
    }
}

var realMadrid = Teams(name: "Real Madrid")
realMadrid.wins+=235
realMadrid.wins

var novakJokovic = TennisPlayer(name: "Novak")
var novakKrkovic = novakJokovic
novakKrkovic.wins = 341
novakKrkovic.country = "Switzerland"

//:**Methods**

struct ChessPlayer {
    var name: String = "Player"
    var wins: Int = 0
    
    init(name:String) {
        self.name = name
    }
    func descriptionOfPlayer() {
        print("Player \(self.name) has \(self.wins) wins.")
    }
    
    mutating func wins(newWins : Int = 1) {
        self.wins += newWins
    }
}
var johnRichard = ChessPlayer(name: "John")
johnRichard.wins
johnRichard.wins()
johnRichard.wins

johnRichard.wins(newWins: 20)
johnRichard.descriptionOfPlayer()





