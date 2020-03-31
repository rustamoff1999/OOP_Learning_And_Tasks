import UIKit

class AboutMan {
    var name = "Имя"
    var surname = "Фамилия"
    lazy var wholeName = self.generateWholeName()   //lazy property     lazy-by-need
    
    lazy var wholeName2 : () -> String = {                            //lazy-by-name
        self.name + " " + self.surname
    }
    
    var wholeName3 : String {return self.name + " " + self.surname}   //computed property
    
    init(firstName:String,secondName:String) {
        (name,surname) = (firstName,secondName)
    }
    
    func generateWholeName()->String {
        return self.name + " " + self.surname
    }
}

var me = AboutMan(firstName: "Fuad", secondName: "Rustamov")
me.wholeName

//lazy properties are lazy by need

me.name = "Mahmood"
me.wholeName
me.wholeName2()
me.name = "Cristiano"
me.wholeName

me.wholeName2()

me.name = "Fuad"
me.wholeName3
me.name = "Mahmood"
me.wholeName2()
me.wholeName
me.name = "Fuad"
me.wholeName3
