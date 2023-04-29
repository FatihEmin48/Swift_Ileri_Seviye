import UIKit



let swiftDescription = "Swift is awesome!"

print(swiftDescription)

for character in swiftDescription{
    print(character)
}

swiftDescription.forEach{ item in
    print(item)
}
//Bunları böyle uzun yapmak yerine
// Mark: - Extension

extension String{
    func printInJapaneseStyle(){
        self.forEach { item in print(item)}
    }
    
    func printInArabicStyle(){
        print(String(self.reversed()))
    }
}

print(swiftDescription)
print(swiftDescription.printInJapaneseStyle())
print(swiftDescription.printInArabicStyle())


protocol SomeProtocol{
    var someProtocolPropety: String { get }
    func someProtocolMethod()
}


class SomeClass {
   
    var someProperty: Int
    
    init(someProperty: Int){
        self.someProperty = someProperty
    }
    
    func someMethods(){
        print("Some Method")
    }
}

// Mark: - SomeProtocol

extension SomeClass: SomeProtocol{
    var someProtocolPropety: String{
        return "Some Protocol Property"
    }
    
    func someProtocolMethod() {
        "Some Protocol Method"
    }
}
