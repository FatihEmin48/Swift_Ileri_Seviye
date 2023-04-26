import UIKit


protocol SomeProtocol{
    var someProperty: String {get set}
}


struct StructName: SomeProtocol{
    var someProperty: String
    //pascal case: İlk harf ile sonraki kelimeler büyük harf
    //let someProperty: Int//Camel case: İlk harf küçük sonraki kelimelerin ilk harfi büyük
}

extension StructName{//Erişemediğimiz yapılara özellik eklemede kullanılıyor
    func getSomeProperty() -> String{
        return someProperty
    }
}



class ClassName: SomeProtocol{
    var someProperty: String
    
    //var someProperty: String
    
    func yourName(){
        print("My name is \(someProperty)")
    }
    
    init(someProperty: String) {
        self.someProperty = someProperty
    }
}

let someStruct = StructName(someProperty: "5")

let className = ClassName(someProperty: ":)")
print(className.yourName())

print(someStruct)
print(someStruct.someProperty)
