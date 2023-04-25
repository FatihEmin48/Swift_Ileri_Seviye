import UIKit

//Closures
let myFirstClosure = {
    print("My First Closure")
}
myFirstClosure()


let sum: (Int, Int) -> Int = { numFirst, numSecond in
    return numFirst + numSecond
}
var result = sum(8, 4)
print(result)

//Tek satırda yapmanın yolu:
let sum2: (Int, Int) -> Int = {return $0 + $1}
result = sum2(7, 2)
print(result)

let oddNumbers = [1, 3, 5, 7, 9, 11]
let evenNumbers = oddNumbers.map {$0 - 1}
print(evenNumbers)

let names = ["Ali", "Ayşe", "Fatma", "Osman", "Ahmet", "Ali"]
var alis = [String]()
for name in names {
    if name == "Ali"{
        alis.append(name)
    }
}
print("Ali sayısı: \(alis.count)")

//Bunu tek satırda yapmanın yolu

var alis2 = names.filter { $0 == "Ali" }
print(alis2.count)


let didCounterValueChanged: (Int) -> Void = { newCounterValue in
    print(newCounterValue)
}
var counter: Int = 0 {
    didSet{
        didCounterValueChanged(counter)
    }
}

counter += 1

counter += 1
