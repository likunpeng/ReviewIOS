import UIKit

//var str = "Hello, playground"
/*
var number = 10

func add (_ num: inout Int) {
    num = 20
}

add(&number)

print(number)

let http404Error = (404, "Not Found")
print(http404Error.0)
print(http404Error.1)

let age = 1
assert(age > 0, "age must be dayu 0")

var sameInts = [Int]()
print("someInts is of type [Int] with \(sameInts.count) items")

var threeDoubles = Array(repeating: 0.0, count: 3)
print(threeDoubles)

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello,\(name)")
}

let numberOfLegs = ["spider":8, "ant":6, "cat":4]
for (animalName, legCount) in numberOfLegs {

}

for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("Hello \(name)")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location)")
}

greet(person: ["name": "join"])

func doSomething(str: String?) {
    let v:String! = str
    if v != nil {
        print("\(v ?? "333")")
    }
    
}

func doSomething01(str: String?) {
    if let v = str {
        print("\(v)")
    }
}

doSomething(str: "123")
doSomething(str: nil)

doSomething01(str: "222")
doSomething01(str: nil)

*/

//func greeting(lll person:String) -> String {
//    "Hello," + person + "!"
//}
//
//print(greeting(lll: "Dave"))
//
//var closure : (Int) -> Int = { (age: Int) in
//        return age
//}
//print(closure(10))

//var str: String = "12345"
//print(str.prefix(2))

//print(str.prefix(upTo: ))

//func myMin<T: Comparable>(_ a: T, _ b: T) -> T {
//    return a < b ? a : b
//}
//
//print(myMin(9, 2))
//
//
//print([1, 2, 3].map{"\($0)"})
//
//print([1, 2, 3].filter{ $0 % 2 == 0})
//
//print([1, 2, 3].reduce(0) { $0 + $1 })
//
//let letters = "abracadabra"
//let letterCount = letters.reduce(into: [:]) { counts, letter in
//    counts[letter, default: 0] += 1
//}
//print(letterCount)
//
//print(#file)
//print(#line)
//print(#column)
//print(#function)

//func makeIncrementer() -> () -> Int {
//    var runningTotal = 10
//    func incrementer() -> Int {
//        runningTotal += 1
//        return runningTotal
//    }
//    return incrementer;
//}
//
//let make = makeIncrementer();
//print(make())
//print(make())
//print(make())
//print(make())

//let test = {(a: String, b: String) -> String in
//     a + b
//}
//
//print(test("hh", "aa"))

//let test = {10}
//print(test())


//let test = { print($0, $1, $2) }
//
//test(1, 2, 3)

//protocol Food { }
//
//protocol Pet {
//    var name: String { get set }
//    var master: String { get }
//    static var species: String { get }
//
//    init(master: String)
//
////    新增协议方法
//    static func sleep()
//    mutating func changeName()
//}
//
//struct Dog: Pet {
//    init(master: String) {
//        self.master = "hhh"
//        self.name = "name"
//    }
//
//
//    var name: String
//
//    var master: String
//
//    static var species: String = "哺乳动物"
//
//    var color: UIColor? = nil
//
//    static func sleep() {
//        print(species)
//    }
//
//    mutating func changeName() {
//        name = "dahuang"
//    }
//}

//var dog = Dog(name: "旺财", master: "小明")

//print(dog.master)

//dog.master = "小吴"

//print(dog.master)

//@objc protocol OptionalProtocol {
//    @objc optional func optionalMethod()
//    func requiredMethod()
//}
//
//protocol OptionalProtocol02 {
//    func optionalMethod()
//    func requiredMethod()
//}
//
//extension OptionalProtocol02 {
//    func optionalMethod() {
//        print("1111111")
//    }
//}
//struct TestStruct: OptionalProtocol02 {
//    func requiredMethod() {
//        print("hhhh")
//    }
//}
//
//let testS = TestStruct()
//testS.requiredMethod()
//testS.optionalMethod()

//struct Test: OptionalProtocol {
//    func optionalMethod() {
//
//    }
//}

//protocol OneProtocol {
//    func oneMethod()
//}
//
//protocol TwoProtocol {
//    func twoMethod()
//}
//
//protocol ThreeProtocol: OneProtocol, TwoProtocol {
//    func threeMethod()
//}
//
//typealias FourProtocol = OneProtocol & TwoProtocol
//
//struct TestStruct: ThreeProtocol {
//    func oneMethod() {
//        print("one")
//    }
//
//    func twoMethod() {
//        print("two")
//    }
//
//    func threeMethod() {
//        print("three")
//    }
//}
//
//struct Test02: FourProtocol {
//    func oneMethod() {
//        print("one")
//    }
//
//    func twoMethod() {
//        print("two")
//    }
//}
//
//let s = TestStruct()
//s.oneMethod()
//s.twoMethod()
//s.threeMethod()
//
//let s1 = Test02()
//s1.oneMethod()
//s1.twoMethod()

//protocol AssociateTypeProtocol {
//    associatedtype LengthType
//    var length:LengthType { get }
//    func printMethod()
//}
//
//struct Pencil: AssociateTypeProtocol {
//    typealias LengthType = Int
//    var length: LengthType
//    func printMethod() {
//        print("\(length)")
//    }
//}
//
//struct Bridge: AssociateTypeProtocol {
//    typealias LengthType = CGFloat
//
//    var length: CGFloat
//
//    func printMethod() {
//        print("\(length)")
//    }
//}
//
//let p = Pencil(length: 10)
//p.printMethod()
//
//let b = Bridge(length: 10.0)
//b.printMethod()

func exec(v1: Int, v2: Int, fn: (Int, Int) -> Int) {
    print(fn(v1, v2))
}


let drving = {
    print("我要去开车")
}
drving()

let dring01 = {(toPlace: String) in
    print("我要开车去\(toPlace)")
}

dring01("beijing")




