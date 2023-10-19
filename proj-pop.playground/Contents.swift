import Foundation

protocol Vehicle {
    var brand: String { get }
    var model: String { get }
    var year: Int { get }
    
    func start()
    func stop()
}

protocol Acceleratable {
    var topSpeed: Double { get }
    func accelerate()
}

enum VehicleState {
    case started
    case stopped
}

struct Car: Vehicle, Acceleratable {
    let brand: String
    let model: String
    let year: Int
    let topSpeed: Double
    
    func start() {
        print("O carro \(brand) \(model) de \(year) está ligado.")
    }
    
    func stop() {
        print("O carro \(brand) \(model) de \(year) está desligado.")
    }
    
    func accelerate() {
        print("O carro \(brand) \(model) de \(year) está acelerando até \(topSpeed) Km/h.")
    }
}

struct Bicycle: Vehicle {
    let brand: String
    let model: String
    let year: Int
    
    func start() {
        print("A bicicleta \(brand) \(model) de \(year) está pronta para pedalar.")
    }
    
    func stop() {
        print("A bicicleta \(brand) \(model) de \(year) foi estacionada com segurança.")
    }
}

let car1 = Car(brand: "Ford", model: "Mustang", year: 2022, topSpeed: 250.0)
let car2 = Car(brand: "Toyota", model: "Camry", year: 2021, topSpeed: 200.0)
let bicycle = Bicycle(brand: "Trek", model: "FX", year: 2023)

let vehicles: [Vehicle] = [car1, car2, bicycle]

let printMessage: (Vehicle) -> Void = { vehicle in
    vehicle.start()
    if let acceleratableVehicle = vehicle as? Acceleratable {
        acceleratableVehicle.accelerate()
    }
    vehicle.stop()
}

for vehicle in vehicles {
    printMessage(vehicle)
}

let dispatchGroup = DispatchGroup()

dispatchGroup.enter()
DispatchQueue.global().async {
    car1.start()
    car1.accelerate()
    car1.stop()
    dispatchGroup.leave()
}

dispatchGroup.enter()
DispatchQueue.global().async {
    car2.start()
    car2.accelerate()
    car2.stop()
    dispatchGroup.leave()
}

dispatchGroup.wait()
