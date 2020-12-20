//
//  main.swift
//  ThirdLesson
//
//  Created by ZamiRich on 19.12.2020.
//  Copyright © 2020 ZamiRich. All rights reserved.
//

import Foundation

//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
    //Why Trunk? it's Truck
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.

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
    var engineIsOn: Bool
//  TODO
//        didSet {
//            switch self {
//            case .true:
//                print("The engine is now On")
//            case .false:
//                print("The engine is now Off")
//            }
    var windowsAreOpen: Bool
    var trunkOccupancy: Int
    
    mutating func engine(action: EngineAction){
        //TODO
        }
    }

struct TruckCar {
    let brand: TruckBrand
    let yearOfProduction: Int
    let trunkBodyCapacity: Int
    var engineIsOn: Bool
    var windowsAreOpen: Bool
    var trunkBodyOccupancy: Int
    
    mutating func engine(action: EngineAction) {
        //TODO
    }
    
    mutating func window(action: WindowsAction) {
        //TODO
    }
}

//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.

var mySportCar = SportCar(brand: .tesla, yearOfProduction: 2019, trunkCapacity: 100, engineIsOn: false, windowsAreOpen: false, trunkOccupancy: 0)

var myTruckCar = TruckCar(brand: .kamaz, yearOfProduction: 2020, trunkBodyCapacity: 3_000, engineIsOn: false, windowsAreOpen: false, trunkBodyOccupancy: 1_000)

mySportCar.engine(action: .startEngine)
myTruckCar.window(action: .openWindows)

//6. Вывести значения свойств экземпляров в консоль.

print(mySportCar.brand)
print(myTruckCar.windowsAreOpen)


