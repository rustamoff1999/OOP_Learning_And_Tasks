import UIKit

//:**Object deleting**

//:*Auto deleting*
class MyClass {
    var description : String
    init(description: String) {
        self.description = description
        print("Object \(description) created")
    }
    deinit {
        print("\nObject \(description) deleted!")
    }
}
let var1 = MyClass(description: "One")
if true {
    let var2 = MyClass(description: "Two")
} //autoDeleting

//:*A few references to object*
class someClass {
    var description : Int
    init(description: Int) {
        self.description = description
        print("\nObject \(description) created")
    }
    deinit {
        print("\nObject \(description) deleted")
    }
}
var someVar1 = someClass(description: 1)
var someVar2 = someVar1//Two references to one object
someVar1 = someClass(description: 2)
someVar2 = someVar1//Object 1 deleted

//:**Memory leak(Example)), weak references**
class Human {
    let name : String
    var child = [Human?]()
   /* weak*/ var father : Human?
   /* weak*/ var mother : Human?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(self.name) deleted")
    }
}
var Kirill : Human? = Human(name: "Kirill")
var Olga : Human? = Human(name: "Olga")
var Aleksey : Human? = Human(name:"Aleksey")
Kirill?.father = Aleksey
Kirill?.mother = Olga
Aleksey?.child.append(Kirill)
Olga?.child.append(Kirill)
Kirill = nil
Aleksey = nil
Olga = nil
// //////////////////////////////////////

//:**Strong/Weak references in closures**

class ClosureWeakReferencee {
    let name : String = "Human"
    deinit {
        print("Object deleted")
    }
}
var closure : (()->())?
if true {
    let human = ClosureWeakReferencee()
    closure = {
        [unowned human] in
        print("\n",human.name)
    }
    closure!()
}
