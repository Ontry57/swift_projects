//
//  main.swift
//  lesson-5
//
//  Created by korolev-ap on 12.07.2020.
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

protocol Car {
    var color: String { get set }
    var navigation: Bool  { get set}
    var transmission: transmission { get set}
    var doorCount: doorCount {get}
    var engineState: engineState  { get set}
    var windowsState: windowsState  { get set}
    var doorsState: doorsState  { get set}
    
    mutating func engineStart()
    mutating func engineStop()
    mutating func windowsOpen()
    mutating func windowsClose()
    mutating func doorsOpen()
    mutating func doorsClose()
}

extension Car {
    mutating func engineStart() {
        engineState = .works
    }
}

extension Car {
    mutating func engineStop() {
        engineState = .stopped
    }
}

extension Car {
    mutating func windowsOpen() {
        windowsState = .opened
    }
}

extension Car {
    mutating func windowsClose() {
        windowsState = .closed
    }
}

extension Car {
    mutating func doorsOpen() {
        doorsState = .opened
    }
}

extension Car {
    mutating func doorsClose() {
        doorsState = .closed
    }
}


class TuncCar: Car {

    var color: String
    var navigation: Bool
    var transmission: transmission
    var doorCount: doorCount
    var engineState: engineState
    var windowsState: windowsState
    var doorsState: doorsState
    var filledTuncVolume: Int
    var tuncVolume: Int
    
    init(color: String, navigation: Bool, transmission: transmission, doorCount: doorCount, engineState: engineState, windowsState: windowsState, doorsState: doorsState, filledTuncVolume: Int, tuncVolume: Int) {
        self.color = color
        self.navigation = navigation
        self.transmission = transmission
        self.doorCount = doorCount
        self.engineState = engineState
        self.windowsState = windowsState
        self.doorsState = doorsState
        self.filledTuncVolume = filledTuncVolume
        self.tuncVolume = tuncVolume
    }
}

extension TuncCar: CustomStringConvertible {
    var description: String{
        get {
            return "\n\nОбщая вместимость: \(tuncVolume) \nСвободно:\(freeTruncVolume)"
        }
    }
}

extension TuncCar{
    var freeTruncVolume: Int {
        get {
            return tuncVolume - filledTuncVolume
        }
    }
}

extension TuncCar{
     func loadIntoTunc(to filledTuncVolume: Int) {
              guard filledTuncVolume <= self.freeTruncVolume else {
                  print("Вы пытаетесь загрузить больше, чем свободно")
                  return
              }
              self.filledTuncVolume += filledTuncVolume
              return
          }
    func unloadFromTunc(to filledTuncVolume: Int) {
        guard filledTuncVolume <= self.filledTuncVolume else {
            print("Вы пытаетесь выгрузить больше, чем занято. Забирайте все, что есть =) ")
            self.filledTuncVolume = 0
            return
        }
        self.filledTuncVolume -= filledTuncVolume
        return
    }
}


class SportCar: Car {

    var color: String
    var navigation: Bool
    var transmission: transmission
    var doorCount: doorCount
    var engineState: engineState
    var windowsState: windowsState
    var doorsState: doorsState
    var maxSpeed: Int
    
    init(color: String, navigation: Bool, transmission: transmission, doorCount: doorCount, engineState: engineState, windowsState: windowsState, doorsState: doorsState, maxSpeed: Int) {
        self.color = color
        self.navigation = navigation
        self.transmission = transmission
        self.doorCount = doorCount
        self.engineState = engineState
        self.windowsState = windowsState
        self.doorsState = doorsState
        self.maxSpeed = maxSpeed
    }
}

extension SportCar: CustomStringConvertible {
    var description: String{
        get {
            return "\n\nМаксимальная скорость:\(maxSpeed)"
        }
    }
}

var tuncCar1 = TuncCar(color: "blue", navigation: false, transmission: .robot, doorCount: .four, engineState: .works, windowsState: .closed, doorsState: .opened, filledTuncVolume: 100, tuncVolume: 500)

print(tuncCar1.doorsState)
tuncCar1.doorsClose()
print(tuncCar1.doorsState)


print (tuncCar1)
tuncCar1.unloadFromTunc(to: 1000)


var sportCar1 = SportCar(color: "white", navigation: false, transmission: .robot, doorCount: .four, engineState: .works, windowsState: .closed, doorsState: .opened, maxSpeed: 300)


print (tuncCar1)
print (sportCar1)
