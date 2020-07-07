//
//  main.swift
//  lesson-4
//
//  Created by korolev-ap on 07.07.2020.
//  Copyright © 2020 Ontry. All rights reserved.
//

import Foundation

enum transmission {
    case auto, robot, mechanical
}
enum doorCount {
    case two, four
}
enum engineState {
    case works, stopped
}
enum windowsState {
    case opened, closed
}
enum doorsState {
    case opened, closed
}


class Car {
    var color: String
    let navigation: Bool
    let transmission: transmission
    var mileage: Double
    let doorCount: doorCount
    var engineState: engineState
    var windowsState: windowsState
    var doorsState: doorsState

    static var carCount = 0
    
        
    init(color: String, navigation: Bool, transmission: transmission, mileage: Double, doorCount: doorCount, engineState: engineState, windowsState: windowsState, doorsState: doorsState) {
        self.color = color
        self.navigation = navigation
        self.transmission = transmission
        self.mileage = mileage
        self.doorCount = doorCount
        self.engineState = engineState
        self.windowsState = windowsState
        self.doorsState = doorsState
        Car.carCount += 1
    }
    
    deinit {
        Car.carCount -= 1
    }
    
    static func countInfo(){
        print("Всего существует \(self.carCount) автомобиля")
    }
    
    func engineStart() {
        engineState = .works
    }
    
    func engineStop() {
        engineState = .stopped
    }
    
    func windowsOpen() {
        windowsState = .opened
    }
    
    func windowsClose() {
        windowsState = .closed
    }
    
    func doorsOpen() {
        doorsState = .opened
    }
    
    func doorsClose() {
        doorsState = .closed
    }
    
   
}


class TruncCar: Car {
    
    var filledTruncVolume: Int
    var truncVolume: Int
    
    var FreeTruncVolume: Int {
        get {
            return truncVolume - filledTruncVolume
        }
    }

    
    func loadIntoTrunc(to filledTruncVolume: Int) {
           guard filledTruncVolume <= self.FreeTruncVolume else {
               print("Вы пытаетесь загрузить больше, чем свободно")
               return
           }
           self.filledTruncVolume += filledTruncVolume
           return
       }
       
       func unloadFromTrunc(to filledTruncVolume: Int) {
           guard filledTruncVolume <= self.filledTruncVolume else {
               print("Вы пытаетесь выгрузить больше, чем занято. Забирайте все, что есть =) ")
               self.filledTruncVolume = 0
               return
           }
           self.filledTruncVolume -= filledTruncVolume
           return
       }
    
    
    init(color: String, navigation: Bool, transmission: transmission, mileage: Double, doorCount: doorCount, engineState: engineState, windowsState: windowsState, doorsState: doorsState, truncVolume: Int, filledTruncVolume: Int = 0) {
        self.filledTruncVolume = filledTruncVolume
        self.truncVolume = truncVolume
        
        super.init(color: color, navigation: navigation, transmission: transmission, mileage: mileage, doorCount: doorCount, engineState: engineState, windowsState: windowsState, doorsState: doorsState)
    }
    
    override func doorsClose() {
        super.doorsClose()
        print("Двери закрыты, можно ехать")
    }
    
}

class SportCar: Car {
    
    var maxSpeed: Int
    
    init(maxSpeed: Int,color: String, navigation: Bool, transmission: transmission, mileage: Double, doorCount: doorCount, engineState: engineState, windowsState: windowsState, doorsState: doorsState) {
        self.maxSpeed = maxSpeed
        
        super.init(color: color, navigation: navigation, transmission: transmission, mileage: mileage, doorCount: doorCount, engineState: engineState, windowsState: windowsState, doorsState: doorsState)
    }
    
    override func windowsOpen() {
        print("Открывать окна запрещено, ухудшаются аэродинамические свойства")
    }
    
}


var car1: SportCar? = SportCar(maxSpeed: 300, color: "blue", navigation: false, transmission: .robot, mileage: 100, doorCount: .four, engineState: .works, windowsState: .closed, doorsState: .opened)


var car2: TruncCar? = TruncCar(color: "blue", navigation: false, transmission: .robot, mileage: 100, doorCount: .four, engineState: .works, windowsState: .closed, doorsState: .opened, truncVolume: 500)

print(car1!.maxSpeed)
print(car2!.truncVolume)

car1!.windowsOpen()
print(car1!.windowsState)

car2!.windowsOpen()
print(car2!.windowsState)


car1!.doorsClose()
print(car1!.doorsState)

car2!.doorsClose()
print(car2!.doorsState)



print(Car.carCount)

car2!.loadIntoTrunc(to: 50)
print(car2!.FreeTruncVolume)

car2 = nil
print(Car.carCount)
