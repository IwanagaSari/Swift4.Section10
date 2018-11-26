//
//  Sec10-3.swift
//  Ssction10
//
//  Created by 岩永 彩里 on 2018/11/26.
//  Copyright © 2018年 岩永 彩里. All rights reserved.
//

import UIKit
//p.255
protocol Monster {
    var monsterName:String {get}
    var hp:Int {get set}
    mutating func updateHp(pt:Int)
}


//Section10-3か10-4
class Sec10_3: UIViewController {
    
    //p.245
    struct ColorBox {
        var width:Int
        var height:Int
        var color:String
    }
    struct WhiteBox {
        var width:Int = 100
        var height:Int = 100
        var color:String = "white"
    }
    //p.247
    struct Ball {
        static let madein = "日本"
        static var sozai = "紙"
        var radius:Double = 10.0
    }
    //p.248
    class BoxClass {
        var size:String = "M"
        var color:String = "red"
    }
    struct BoxStruct {
        var size:String = "M"
        var color:String = "red"
    }
    //p.250
    struct Box {
        let width:Int
        let height:Int
        let size:String
        
        init(width:Int, height:Int){
            self.width = width
            self.height = height
            
            if (width+height)<250 {
                size = "M"
            } else {
                size = "L"
            }
        }
        
    }
    //p.251
    struct Goods {
        let tanka:Int
        let kosu:Int
        
        var price:Int {
            return tanka*kosu
        }
        
        func sellprice(nebiki:Int = 0) ->Int {
            return price - nebiki*kosu
        }
    }
    //p.253
    struct Line {
        var p1:Point
        var p2:Point
        
        mutating func move(h:Double, v:Double){
            p1.x += h
            p1.y += v
            p2.x += h
            p2.y += v
        }
        
    }
    
    struct Point {
        var x:Double
        var y:Double
    }
    
    //p.253
    struct Stock {
        var name:String
        var data:[String:Int] = [:]
        
        init(name:String){
            self.name = name
        }
        subscript(color:String, size:Double) -> Int {
            get {
                let key = color + String(size)
                if let value = data[key] {  //?????
                    return value
                } else {
                    return 0
                }
            }
            set {
                let key = color + String(size)
                data[key] = newValue
            }
        }
    }
    //p.255
    struct Bokemon:Monster {
        private(set) var monsterName: String
        var hp: Int
        
        mutating func updateHp(pt: Int) {
            hp += pt
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //p.246
        let redBox = ColorBox(width: 120, height: 100, color: "red")
        let theBox = WhiteBox()
        print((redBox.width, redBox.height, redBox.color))
        print((theBox.width, theBox.height, theBox.color))
        let myBox = WhiteBox(width: 150, height: 200, color: "white")
        print(myBox.width, myBox.height, myBox.color)
        
        //p.247
        var redBox2 = ColorBox(width: 100, height: 100, color: "red")
        print("幅\(redBox2.width)、高さ\(redBox2.height)、色\(redBox2.color)")
        redBox2.width = 90
        print("幅\(redBox2.width)、高さ\(redBox2.height)、色\(redBox2.color)")
        //p.248
        Ball.sozai = "木"
        let ball1 = Ball(radius: 15)
        let ball2 = Ball()
        print(ball1.radius)
        print(ball2.radius)
        print(Ball.madein)
        print(Ball.sozai)
        
        //p.249
        let cBox1 = BoxClass()
        let cBox2 = cBox1
        cBox2.color  = "green"
        
        let cBox3 = BoxStruct()
        var cBox4 = cBox3
        cBox4.color = "green"
        
        print("cBox1:\(cBox1.size) \(cBox1.color)")
        print("cBox1:\(cBox2.size) \(cBox2.color)")
        print("cBox1:\(cBox3.size) \(cBox3.color)")
        print("cBox1:\(cBox4.size) \(cBox4.color)")
        
        //p.250
        let box1 = Box(width: 120, height: 80)
        let box2 = Box(width: 150, height: 120)
        print(box1)
        print(box2)
        
        //p.251
        
        let myGoods = Goods(tanka: 700, kosu: 4)
        let selling_price = myGoods.sellprice(nebiki: 10)
        print("1個\(myGoods.tanka)円、\(myGoods.kosu)個入り、定価\(myGoods.price)円")
        print("販売価格\(selling_price)円")
        
        //p.252
        let point1 = Point(x:100, y:100)
        let point2 = Point(x: 300, y: 200)
        var theLine = Line(p1: point1, p2: point2)
        
        print("移動前のp1\(theLine.p1)")
        print("移動前のp2\(theLine.p2)")
        print("----------------------")
        
        theLine.move(h: 50, v:60)
        print("移動後のp1\(theLine.p1)")
        print("移動後のp2\(theLine.p2)")
        
        //p.254
        var shoes = Stock(name: "Tiger")
        shoes["green", 24.5] = 3
        shoes["green", 25.0] = 5
        
        shoes["green", 24.5] -= 2
        shoes["green", 25.0] += 1
        shoes["red", 26.0] = 5
        
        print(shoes.name)
        print(shoes["green", 24.5])
        print(shoes["green", 25.0])
        print(shoes["red", 26.0])
        
        print(shoes["red", 25.5])
        print(shoes["white", 25.0])
        
        //p.256
        var aMonster = Bokemon(monsterName: "スイフィー", hp: 200)
        print(aMonster.monsterName)
        print("HPポイント\(aMonster.hp)")
        
        aMonster.updateHp(pt: 30)
        print("HPポイント\(aMonster.hp)")
    }
}
