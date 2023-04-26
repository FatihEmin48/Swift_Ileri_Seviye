import UIKit

//Private: En kısıtlı erişim düzeyi

class SomeClass{
    private var someProperty: String //Dışarıdan erişim yok, erişim için fonksiyon oluşturabiliriz
    init(someProperty: String){
        self.someProperty = someProperty
    }
    
    /*
     func getSomeProperty() -> String {
        return someProperty
    }
     */
    //bu yöntem pek kullanılmıyor, yaygın kullanılan yöntem:
    var getSomeProperty: String{
        return someProperty
    }
    //Daha kısası değer ataması yapamadan sadece okuma yapacaksak:
    //private(set) var someProperty: String şeklinde yapabiliriz
    
    //Dahada kısası
    //let someProperty: String
    //Şeklinde yaparsakta işimizi görür
}

let someClass = SomeClass(someProperty: "Default Value")
print(someClass.getSomeProperty)
//Private yaparak
//someClass.someProperty = "New Value"
//gibi dışarıdan değer değiştirmenin önüne geçtik


class SomeSubclass: SomeClass{
    let counter: Int = 0
    init(){
        super.init(someProperty: "Default Value")
    }
}
let someSubclass = SomeSubclass()

print(someSubclass.getSomeProperty)


//Fileprivate: Dosya dışında kullanıma kapalı


//Internal: Varsayılan erişim düzeyi. Alt sınıflar erişebilir. Dışarıdan erişilebilir


//Public: Modüller arası erişim


//Open: Override etme gibi iç yapıda değişiklik yapacak seviyede erişim yetkisi verir


