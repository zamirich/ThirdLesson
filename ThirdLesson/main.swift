//
//  main.swift
//  ThirdLesson
//
//  Created by ZamiRich on 19.12.2020.
//  Copyright © 2020 ZamiRich. All rights reserved.
//

import Foundation

//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar. - DONE
    //Why Trunk? it's Truck
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника. - DONE
//3. Описать перечисление с возможными действиями с автомобилем:
//запустить/заглушить двигатель - DONE,
//открыть/закрыть окна - DONE,
//погрузить/выгрузить из кузова/багажника груз определенного объема - DONE
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.- DONE

enum SportBrand {
    case porsche
    case tesla
    case mazeratti
    case bugatti
    case lada
}

enum TruckBrand {
    case kamaz
    case man
    case mercedes
    case volvo
}

enum EngineState { //trying this instead of boolean for engine state
    case engineIsOn
    case engineIsOff
}

enum EngineAction {
    case startEngine
    case stopEngine
}

enum WindowsAction {
    case openWindows
    case closeWindows
}

struct SportCar {
    let brand: SportBrand
    let yearOfProduction: Int
    let trunkCapacity: Int
    var engineState: EngineState {
        didSet {
            switch engineState {
            case .engineIsOn:
                print("\(brand)'s engine is now On")
            case .engineIsOff:
                print("\(brand)'s engine is now Off")
            }
        }
    }
    var windowsAreOpen: Bool {
        didSet {
            switch windowsAreOpen {
            case true:
                print("\(brand)'s windows are now opened")
            case false:
                print("\(brand)'s windows are now closed")
            }
        }
    }
    var trunkOccupancy: Int
    
    mutating func engine(action: EngineAction){
        switch action {
        case .startEngine:
            engineState = .engineIsOn
        case .stopEngine:
            engineState = .engineIsOff
        }
    }
    
    mutating func window(action: WindowsAction){
        switch action {
        case .openWindows:
            windowsAreOpen = true
        case .closeWindows:
            windowsAreOpen = false
        }
    }
}

struct TruckCar {
    let brand: TruckBrand
    let yearOfProduction: Int
    let truckBodyCapacity: Int
    var engineState: EngineState {
        didSet {
            switch engineState {
            case .engineIsOn:
                print("\(brand)'s engine is now On")
            case .engineIsOff:
                print("\(brand)'s engine is now Off")
            }
        }
    }
    var windowsAreOpen: Bool {
        didSet {
            switch windowsAreOpen {
            case true:
                print("\(brand)'s windows are now opened")
            case false:
                print("\(brand)'s windows are now closed")
            }
        }
    }
    var truckBodyOccupancy: Int {
        willSet {
            print("\(brand)'s available occupancy was \(truckBodyOccupancy) out of \(truckBodyCapacity)")
        }
        didSet {
            print("\(brand)'s current occupancy is \(truckBodyOccupancy) out of \(truckBodyCapacity)")
        }
    }
    
    mutating func engine(action: EngineAction){
        switch action {
        case .startEngine:
            engineState = .engineIsOn
        case .stopEngine:
            engineState = .engineIsOff
        }
    }
    
    mutating func window(action: WindowsAction){
        switch action {
        case .openWindows:
            windowsAreOpen = true
        case .closeWindows:
            windowsAreOpen = false
        }
    }
    
    mutating func loadCargoInTruck(of weight: Int){
        if truckBodyOccupancy == truckBodyCapacity {
            print("This truck is full. You can't put cargo in it anymore")
        } else if weight > (truckBodyCapacity - truckBodyOccupancy) {
            print("The cargo is too heavy. You can't put all into the truck")
        } else {
            print("\(weight) of cargo were placed into the truck")
            truckBodyOccupancy += weight
        }
    }
}

//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.

var mySportCar = SportCar(brand: .tesla, yearOfProduction: 2019, trunkCapacity: 100, engineState: .engineIsOff, windowsAreOpen: false, trunkOccupancy: 0)

var myTruckCar = TruckCar(brand: .kamaz, yearOfProduction: 2020, truckBodyCapacity: 3_000, engineState: .engineIsOff, windowsAreOpen: false, truckBodyOccupancy: 1_000)

mySportCar.engine(action: .startEngine)
mySportCar.engine(action: .stopEngine)
mySportCar.window(action: .closeWindows)
mySportCar.window(action: .openWindows)

myTruckCar.window(action: .openWindows)

myTruckCar.loadCargoInTruck(of: 5_000) //проверим, что невозможно погрузить в кузов больше его остаточной вместимости
myTruckCar.loadCargoInTruck(of: 1_100)

//6. Вывести значения свойств экземпляров в консоль.

print("")
print(mySportCar.brand)
print(myTruckCar.windowsAreOpen)
print(myTruckCar.truckBodyOccupancy)
print(myTruckCar.truckBodyCapacity)
print("")

