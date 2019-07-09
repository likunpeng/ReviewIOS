//
//  ViewController.swift
//  StudySwift
//
//  Created by lkp on 2017/12/11.
//  Copyright © 2017年 lkp. All rights reserved.
//

import UIKit

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

class ViewController: UIViewController {
    var reference1: Person?
    var reference2: Person?
    var reference3: Person?

    var john: Person?
    var unit4A: Apartment?

    var john02: Customer?

    override func viewDidLoad() {
        super.viewDidLoad()
//        testStr()
//        testEnum()
//        testBaseClass()
//        testInitMethod()
//        testCustomInit()
//        testDefaultInit()
//        testInit()

//        testARC()
//        testOptional()
//        testASIS()
//        testExtension()
    }

    func testExtension() {
        let oneInch = 25.4.mm
        print("One inch is \(oneInch) meters")
        // 打印“One inch is 0.0254 meters”
        let threeFeet = 3.ft
        print("Three feet is \(threeFeet) meters")
    }

    func testSuit() {
        struct BlackjackCard {

            // 嵌套的 Suit 枚举
            enum Suit: Character {
                case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
            }

            // 嵌套的 Rank 枚举
            enum Rank: Int {
                case two = 2, three, four, five, six, seven, eight, nine, ten
                case jack, queen, king, ace
                struct Values {
                    let first: Int, second: Int?
                }
                var values: Values {
                    switch self {
                    case .ace:
                        return Values(first: 1, second: 11)
                    case .jack, .queen, .king:
                        return Values(first: 10, second: nil)
                    default:
                        return Values(first: self.rawValue, second: nil)
                    }
                }
            }

            // BlackjackCard 的属性和方法
            let rank: Rank, suit: Suit
            var description: String {
                var output = "suit is \(suit.rawValue),"
                output += " value is \(rank.values.first)"
                if let second = rank.values.second {
                    output += " or \(second)"
                }
                return output
            }
        }
    }

    func testASIS() {
        let library = [
            Movie(name: "Casablanca", director: "Michael Curtiz"),
            Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
            Movie(name: "Citizen Kane", director: "Orson Welles"),
            Song(name: "The One And Only", artist: "Chesney Hawkes"),
            Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
        ]
        // 数组 library 的类型被推断为 [MediaItem]
        var movieCount = 0
        var songCount = 0

        for item in library {
            if item is Movie {
                movieCount += 1
            } else if item is Song {
                songCount += 1
            }
        }
        print("Media library contains \(movieCount) movies and \(songCount) songs")

        for item in library {
            if let movie = item as? Movie {
                print("Movie: \(movie.name), dir. \(movie.director)")
            } else if let song = item as? Song {
                print("Song: \(song.name), by \(song.artist)")
            }
        }
    }

    class Movie: MediaItem {
        var director: String
        init(name: String, director: String) {
            self.director = director
            super.init(name: name)
        }
    }

    class Song: MediaItem {
        var artist: String
        init(name: String, artist: String) {
            self.artist = artist
            super.init(name: name)
        }
    }

    class MediaItem {
        var name: String
        init(name: String) {
            self.name = name
        }
    }

    func testOptional() {
        let john = Person()
//        let roomCount = john.residence!.numberOfRooms
        if let roomCount = john.residence?.numberOfRooms {
            print("John's residence has \(roomCount) room(s).")
        } else {
            print("Unable to retrieve the number of rooms.")
        }
    }

    func testARC() {
//        reference1 = Person(name: "John Appleseed")
//        reference2 = reference1
//        reference3 = reference1
//        reference1 = nil
//        reference2 = nil
//        reference3 = nil
//        john = Person(name: "John Appleseed")
//        unit4A = Apartment(unit: "4A")
//        john!.apartment = unit4A
//        unit4A!.tenant = john

//        john = nil
//        unit4A = nil
//
//        john02 = Customer(name: "John Appleseed")
//        john02!.card = CreditCard(number: 1234_5678_9012_3456, customer: john02!)
//        john02 = nil
    }

    class Customer {
        let name: String
        var card: CreditCard?
        init(name: String) {
            self.name = name
        }
        deinit { print("\(name) is being deinitialized") }
    }

    class CreditCard {
        let number: UInt64
        unowned let customer: Customer
        init(number: UInt64, customer: Customer) {
            self.number = number
            self.customer = customer
        }
        deinit { print("Card #\(number) is being deinitialized") }
    }

    class Residence {
        var rooms = [Room]()
        var numberOfRooms: Int {
            return rooms.count
        }
        subscript(i: Int) -> Room {
            get {
                return rooms[i]
            }
            set {
                rooms[i] = newValue
            }
        }
        func printNumberOfRooms() {
            print("The number of rooms is \(numberOfRooms)")
        }
        var address: Address?
    }

    class Room {
        let name: String
        init(name: String) { self.name = name }
    }

    class Address {
        var buildingName: String?
        var buildingNumber: String?
        var street: String?
        func buildingIdentifier() -> String? {
            if buildingName != nil {
                return buildingName
            } else if let buildingNumber = buildingNumber, let street = street {
                return "\(buildingNumber) \(street)"
            } else {
                return nil
            }
        }
    }

    class Person {
        var residence: Residence?
//        let name: String

//        init(name: String) {
//            self.name = name
//            print("\(name) is being initialized")
//        }

//        var apartment: Apartment?
//        deinit {
//            print("\(name) is being deinitialized")
//        }
    }

    class Apartment {
        let unit: String
        init(unit: String) { self.unit = unit }
        weak var tenant: Person?
        deinit { print("Apartment \(unit) is being deinitialized") }
    }

    func testInit() {
        let namedMeat = Food(name: "Bacon")
        print(namedMeat.name)

        let mysteryMeat = Food()
        print(mysteryMeat.name)
    }

    class Food {
        var name: String
        init(name: String) {
            self.name = name
        }
        convenience init() {
            self.init(name: "[Unnamed]")
        }
    }

    func testDefaultInit() {
        let item = ShoppingListItem()
        print(item.name)

        let twoByTwo = Size(width: 2.0, height: 2.0)
        print(twoByTwo.width)
    }

    struct Rect {
        var origin = Point()
        var size = Size()
        init() {}
        init(origin: Point, size: Size) {
            self.origin = origin
            self.size = size
        }
        init(center: Point, size: Size) {
            let originX = center.x - (size.width / 2)
            let originY = center.y - (size.height / 2)
            self.init(origin: Point(x: originX, y: originY), size: size)
        }
    }

    struct Size {
        var width = 0.0, height = 0.0
    }

    struct Point {
        // swiftlint:disable identifier_name
        var x = 0.0, y = 0.0
    }

    class ShoppingListItem {
        var name: String?
        var quantity = 1
        var purchased = false
    }

    class SurveyQuestion {
        var text: String
        var response: String?
        init(text: String) {
            self.text = text
        }
        func ask() {
            print(text)
        }
    }

    struct Color {
        let red, green, blue: Double
        init(red: Double, green: Double, blue: Double) {
            self.red   = red
            self.green = green
            self.blue  = blue
        }
        init(white: Double) {
            red   = white
            green = white
            blue  = white
        }
    }

    struct Celsius {
        var temperatureInCelsius: Double
        init(fromFahrenheit fahrenheit: Double) {
            temperatureInCelsius = (fahrenheit - 32.0) / 1.8
        }

        init(fromKelvin kelvin: Double) {
            temperatureInCelsius = kelvin - 273.15
        }

        init(_ celsius: Double) {
            temperatureInCelsius = celsius
        }
    }

    func testCustomInit() {
        let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
        // boilingPointOfWater.temperatureInCelsius 是 100.0
        print(boilingPointOfWater)
        let freezingPointOfWater = Celsius(fromKelvin: 273.15)
        print(freezingPointOfWater)

        let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
        cheeseQuestion.ask()
        // 打印 "Do you like cheese?"
        cheeseQuestion.response = "Yes, I do like cheese."

//        let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
//        let halfGray = Color(white: 0.5)
    }

    struct Fahrenheit {
        var temperature: Double
        init() {
            temperature = 32.0
        }
    }

    func testInitMethod() {
        let fah = Fahrenheit()
        print("The default temperature is \(fah.temperature)° Fahrenheit")
    }

    func testBaseClass() {
        let someValue = Vehicle()
        print("Vehicle:\(someValue.description)")

        let bicycle = Bicycle()
        bicycle.hasBasket = true
        bicycle.currentSpeed = 15.0
        print("bicycle:\(bicycle.description)")

        let tandem = Tandem()
        tandem.hasBasket = true
        tandem.currentNumberOfPassengers = 2
        tandem.currentSpeed = 22.0
        print("Tandem: \(tandem.description)")

        let train = Train()
        train.makeNoise()

    }

    class Train: Vehicle {
        override func makeNoise() {
            print("Choo Choo")
        }
    }

    class Tandem: Bicycle {
        var currentNumberOfPassengers = 0
    }

    class Bicycle: Vehicle {
        var hasBasket = false
    }

    class Vehicle {
        var currentSpeed = 0.0
        var description: String {
            return "traveling at \(currentSpeed) miles per hour"
        }
        func makeNoise() {
            // 什么也不做-因为车辆不一定会有噪音
        }
    }

    func testEnum() {
        let five = ArithmeticExpression.number(5)
        print(five)
        let four = ArithmeticExpression.number(4)
        print(four)
        let sum = ArithmeticExpression.addition(five, four)
        print(sum)

        print(evaluate(sum))
    }

    func evaluate(_ expression: ArithmeticExpression) -> Int {
        switch expression {
        case let .number(value):
            return value
        case let .addition(left, right):
            return evaluate(left) + evaluate(right)
        case let .multiplication(left, right):
            return evaluate(left) * evaluate(right)
        }
    }


    func testCloserCapturingValue() {
//        makeIncrementer(forIncrement: 10)
    }

    func makeIncrementer(forIncrement amount: Int) -> () -> Int {
        var runningTotal = 0
        func incrementer() -> Int {
            runningTotal += amount
            return runningTotal
        }
        return incrementer
    }

    func historyTestCode() {
//        reference1 = Person(name: "lkp")
//
//        reference2 = reference1
//        reference3 = reference1
//
//        reference1 = nil
//        reference2 = nil
//        reference3 = nil

        //        let digitNames = [
        //            0: "Zero",1: "One",2: "Two",  3: "Three",4: "Four",
        //            5: "Five",6: "Six",7: "Seven",8: "Eight",9: "Nine"
        //        ]
        //
        //        let numbers = [16,58,510]
        //
        //        let strings = numbers.map {
        //            (number) -> String in
        //            var number = number
        //            var output = ""
        //            repeat {
        //                output = digitNames[number % 10]! + output
        //                number /= 10
        //            } while number > 0
        //            return output
        //        }
        //        print(strings)
        // Do any additional setup after loading the view, typically from a nib.

        //        if let firstValue = Int("4") {
        //            print("firstValue = \(firstValue)")
        //        }

        //        print("firstValue = \(_hashValue)")

        //        let a = 1+ 2

        //        let p = Person()
        //        Person.testClass()
        //        print(p.testReturn(a: 2))

        //        let a = Animal()
        //        let arr = [1,2,3]
        //        for _ in arr {
        //
        //        }
        //        for(int i = 0 ; i < 10; i++){
        //
        //            // 你需要做的操作
        //        }
        //        for i in 0..<arr.count {
        //
        //        }

        //        for index in stride(from: 1, to: 6, by: 2) {
        //            print(index)
        //        }
    }

    func testStr() {
        let softWrappedQuotation = """


The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."





"""
        print(softWrappedQuotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

