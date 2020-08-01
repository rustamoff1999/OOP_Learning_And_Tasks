import UIKit

struct Room {
    var square : Int
}

class Residence {
    var rooms : [Room]?
    func roomsCount() -> Int {
        if let rooms = self.rooms {
            return rooms.count
        }
        else {
            return 0
        }
    }
}

class Person {
    var residence : Residence?
}
//:**This is bad, and would be too difficult if we had many object types**
var person = Person()
if let place = person.residence {
    if let rooms = place.rooms {
        var j = 1
        for oneRoom in rooms where j < rooms.count+1 {
            print("\(j) room has \(oneRoom.square) square")
            j+=1
        }
    }
    else {
        print("There are no rooms in the residence")
    }
}
else {
    print("The person has not a residence")
}
print("Let's use Optional chainings\n")
//:*Let's use Optional chainings*
var man = Person()
var residence = Residence()
man.residence = residence
let room1 = Room(square: 35)
let room2 = Room(square: 20)
residence.rooms = [room1,room2]
if let rooms = man.residence?.rooms {
    for oneRoom in rooms {
        print("Has a room with \(oneRoom.square) square")
    }
}
else {
    print("Has not rooms or a residence")
}

let room3 = Room(square: 40)
man.residence?.rooms?.append(room3)//Optional chaining
print("Now residence has three rooms")
//:*Method and property call through Optional chaining*
man.residence?.roomsCount()
man.residence?.rooms
