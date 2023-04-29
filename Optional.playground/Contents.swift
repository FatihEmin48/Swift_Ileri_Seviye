import UIKit

var someOptionalVariable: Int? = 3
var someVariable: Int = 5

print(someOptionalVariable)

//var sum = someOptionalVariable + someVariable optional olduğundan 2 değeri toplayamıyor
//1.Yol ! ile zorlama
var sum = someOptionalVariable! + someVariable//! ile içini zorla açıyoruz ve hata vermiyor
print(sum)
//ilk başta optional'a 3 atadığımız için çalıştı atamasaydık hata verecekti
//Bu yüzden ! tehlikeli


//2.Yol daha güvenilir
if let unwrappedValue = someOptionalVariable{
    var sum = unwrappedValue + someVariable
    print("if bloğu içindeki sum: \(sum)")
}else {
    print("Value is nil.")
}

//3. Yol Guard
//guard booleanKoşul else{ işlem başarısız olduğunda burası çalışır }
func guardUnwrapExamp() {
    guard let unwrappedValue = someOptionalVariable else{
        print("Value is nil.")
        return
    }
    let sum = unwrappedValue + someVariable
    print(sum)
}

guardUnwrapExamp()
