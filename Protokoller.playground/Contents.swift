import UIKit

protocol SomeProtocol {
    var someGetProperty: Int {get}
    var someGetAndSetProperty: String {get}
    func someMethod(someParameter: Double) -> Float
}

extension SomeProtocol{
    func someUtility() {
        print("SomeUtility")
    }
}

class SomeSuperClass {
    var someSuperProperty: Bool = false
}

class SomeClass: SomeSuperClass, SomeProtocol, Equatable {
    var id: Int
    static func == (lhs: SomeClass, rhs: SomeClass) -> Bool {
        return lhs.id == rhs.id
    }
    
    var someGetProperty: Int = .zero//kodda 0 dursun istemiyorsan bu da 0 yerine geçiyor
    
    var someGetAndSetProperty: String
    
    func someMethod(someParameter: Double) -> Float {
        return .zero
    }
    
    init(id: Int) {
        self.id = id
        someGetAndSetProperty = "Default Value"
    }
}

let firstSomeClass = SomeClass(id: 0)
let secondSomeClass = SomeClass(id: 1)

firstSomeClass.someUtility()

if firstSomeClass == secondSomeClass{
    print("Eşit")
}else{
    print("Eşit değil")
}

struct SomeStruct: SomeProtocol{
    var someGetProperty: Int
    var someGetAndSetProperty: String
    func someMethod(someParameter: Double) -> Float {
        return .zero
    }
}

let someStruct = SomeStruct(someGetProperty: 0, someGetAndSetProperty: "")
someStruct.someUtility()

enum SomeEnum: SomeProtocol{
    var someGetProperty: Int {.zero}
    var someGetAndSetProperty: String {"Default Value"}
    func someMethod(someParameter: Double) -> Float {
        return .zero
    }
}

enum HavaDurumu: Int, CaseIterable {//enumu array gibi kullanabilmek için CaseIterable kullanılıyor
    case acik
    case yagmurlu
    case bulutlu
}

for havaDurumu in HavaDurumu.allCases{
    print(havaDurumu.rawValue)
}
