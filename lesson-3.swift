import Foundation

enum doorCount {
    case two, four
}
enum engineState {
    case works, stopped
}
enum windowsState {
    case opened, closed
}
struct Car {
    var model: String
    let year: Int
    var colour: String
    let truncVolume: Int
    let doorCount: doorCount
    var engineState: engineState
    var windowsState: windowsState
    var filledTruncVolume: Int
    
    mutating func engineStart() {
        self.engineState = .works
    }
    mutating func engineStop() {
        self.engineState = .stopped
    }
    mutating func windowsOpen() {
        self.windowsState = .opened
    }
    mutating func windowsClose() {
        self.windowsState = .closed
    }
    mutating func loadIntoTrunc(to filledTruncVolume: Int) {
        guard filledTruncVolume <= self.FreeTruncVolume else {
            print("Вы пытаетесь загрузить больше, чем свободно")
            return
        }
        self.filledTruncVolume += filledTruncVolume
        return
    }
    
    mutating func unloadFromTrunc(to filledTruncVolume: Int) {
        guard filledTruncVolume <= self.filledTruncVolume else {
            print("Вы пытаетесь выгрузить больше, чем занято. Забирайте все, что есть =) ")
            self.filledTruncVolume = 0
            return
        }
        self.filledTruncVolume -= filledTruncVolume
        return
    }
    var FreeTruncVolume: Int {
        get {
            return truncVolume - filledTruncVolume
        }
    }
    
    init?(model: String, year: Int,colour: String, truncVolume: Int, doorCount: doorCount = .four, engineState: engineState = .stopped,windowsState: windowsState = .closed, filledTruncVolume: Int = 0) {
        guard year <= 2020 else {
            return nil
        }
        guard filledTruncVolume <= truncVolume else {
            print("объем груза больше, чем вместительность багажника")
            return nil
        }
        self.model = model
        self.year = year
        self.colour = colour
        self.doorCount = doorCount
        self.engineState = engineState
        self.windowsState = windowsState
        self.truncVolume = truncVolume
        self.filledTruncVolume = filledTruncVolume
        
    }
}

var car1 = Car(model: "Volvo", year: 2010, colour: "Red", truncVolume: 100 )
var car2 = Car(model: "BMW", year: 2017, colour: "Estoril Blue", truncVolume: 200)

print(car2!.FreeTruncVolume)
car2!.loadIntoTrunc(to: 100)
print(car2!.FreeTruncVolume)
car2!.loadIntoTrunc(to: 100)
print(car2!.FreeTruncVolume)
car2!.loadIntoTrunc(to: 100)
print(car2!.FreeTruncVolume)
car2!.unloadFromTrunc(to: 100)
print(car2!.FreeTruncVolume)
car2!.unloadFromTrunc(to: 400)
print(car2!.FreeTruncVolume)
print(car2!.engineState)
car2!.engineStart()
print(car2!.engineState)
car2!.engineStop()
print(car2!.engineState)
print(car2!.model)
