//
//  ViewController.swift
//  Ssction10
//
//  Created by 岩永 彩里 on 2018/11/19.
//  Copyright © 2018年 岩永 彩里. All rights reserved.
//

import UIKit

enum Season {
    case Spring, Summer, Autum, Winter
}

class MyClass {
    let kisetsu = Season.Autum
    func sukinaKisetsu() -> Season {
        return kisetsu
    }
}

class ViewController: UIViewController {
    
    enum MensSize { //グローバルな列挙型
        case S
        case M
        case L
        case XL
    }
    enum WomensSize {
        case XS, S, M, L
    }
    enum Grade {
        case Matsu, Take, Ume
    }
    //p.240
    enum Ticket {
        case Gold, A, B
        //タイププロパティ
        static var name = "入場券"
        //席
        var areas:String {
            get{
                switch self {
                case .Gold:
                    return "ゴールド席"
                case .A:
                    return "A席"
                case .B:
                    return "B席"
                }
            }
        }
        //価格
        var price:Int {
            get{
                switch self {
                case .Gold:
                    return 24000
                case .A:
                    return 5000
                case .B:
                    return 2000
                    
                }
            }
        }
    }
    //p.242
    enum Signal:String {
        case Green = "緑色"
        case Red = "赤色"
        
        var color:String {
            return self.rawValue
        }
        static func description() -> String {
            return "GreenまたはRedのシグナルです。"
        }
        func isRun() -> Bool {
            if self == .Green{
                return true
            }else{
                return false
            }
        }
        mutating func turn(){
            if self == .Green{
                self = .Red
            }else{
                self = .Green
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var mySize = MensSize.M
        mySize = .S
        
        var herSize:WomensSize
        herSize = .XS
        
        print(mySize)
        print(herSize)
        
        let theStuff = packing(size: .M)
        print(theStuff)
        
        let kisetsu = Season.Winter
        let gradeType = Grade.Matsu
        print(kisetsu)
        print(gradeType)
        
        //p.235
        p_235()
        //p.237-238
        p_237()
        //p.241
        Ticket.name = "超ライブ入場券"
        
        let ticket1 = Ticket.A
        let ticket2 = Ticket.Gold
        
        print(Ticket.name, ticket1.areas, ticket1.price)
        print(Ticket.name, ticket2.areas, ticket2.price)
        
        //p.242
        let text = Signal.description()
        print(text)
        var lamp = Signal.Green
        print(lamp.color)
        print(lamp.isRun())
        print("値を反映する")
        lamp.turn()
        print(lamp.color)
        print(lamp.isRun())
        let text2 = Signal.description()
        print(text2)
        
        
    }
    
    func packing(size:WomensSize) -> String {
        var stuff:String
        switch size {
        case .XS, .S :
            stuff = "女性用XS、Sサイズ備品"
        case .M :
            stuff = "女性用Mサイズ備品"
        case .L:
            stuff = "女性用Lサイズ備品"
        }
        return stuff
    }
    
    func p_235() {
        enum Direction:Int {
            case forward = 1
            case backword
            case right
            case left
        }
        
        let muki1 = Direction.forward
        let muki2 = Direction.backword
        let muki3 = Direction.right
        let muki4 = Direction.left
        print(muki1.rawValue)
        print(muki2.rawValue)
        print(muki3.rawValue)
        print(muki4.rawValue)
        
        let muki5 = Direction(rawValue: 3)
        if let muki = muki5 {
            print(muki)
        }
    }
    func p_237(){
        enum Pattern {
            case Monotone(_: PColor)
            case Border(color1: PColor, color2: PColor)
            case Dots(base:PColor, dot1:PColor, dot2:PColor)
            
            enum PColor:String {
                case red = "赤"
                case green = "緑"
                case yellow = "黄"
                case white = "白"
            }
        }
        
        let shirt1 = Pattern.Monotone(.red)
        let shirt2 = Pattern.Border(color1: .white, color2: .red)
        let shirt3 = Pattern.Dots(base: .yellow, dot1: .white, dot2: .green)
        
        let patternList = [shirt1, shirt2, shirt3]
        for thePattern in patternList {
            switch thePattern {
            case .Monotone(let c):
                    print("\(c.rawValue)の無地")
            case .Border(let c1, let c2):
                print("\(c1.rawValue)と\(c2.rawValue)のボーダー")
            case let .Dots(base, dot1, dot2):
                let bColor = base.rawValue
                let dc1 = dot1.rawValue
                let dc2 = dot2.rawValue
                print("\(bColor)地に\(dc1)と\(dc2)のボーダー")
            }
        }
    }


}

