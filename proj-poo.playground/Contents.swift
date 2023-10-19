import Cocoa

class Vehicle {
    var model: String
    var maxSpeed: Double
    var fuelType: String

    init(model: String, maxSpeed: Double, fuelType: String) {
        self.model = model
        self.maxSpeed = maxSpeed
        self.fuelType = fuelType
    }

    func startEngine() {
        print("O motor do veículo \(model) está ligado.")
    }

    func stopEngine() {
        print("O motor do veículo \(model) está desligado.")
    }
}

class Car: Vehicle {
    var passengerCapacity: Int

    init(model: String, maxSpeed: Double, fuelType: String, passengerCapacity: Int) {
        self.passengerCapacity = passengerCapacity
        super.init(model: model, maxSpeed: maxSpeed, fuelType: fuelType)
    }
}

class Motorcycle: Vehicle {
}

class Bicycle: Vehicle {
    override func startEngine() {
        print("Uma bicicleta não tem motor para ligar.")
    }

    override func stopEngine() {
        print("Uma bicicleta não tem motor para desligar.")
    }
}

enum VehicleType {
    case car
    case motorcycle
    case bicycle
}

let vehicleTypes: [VehicleType] = [.car, .motorcycle, .bicycle]

func printVehicleInfo(vehicleType: VehicleType) {
    switch vehicleType {
    case .car:
        let car = Car(model: "Sedan", maxSpeed: 200.0, fuelType: "Gasolina", passengerCapacity: 5)
        car.startEngine()
    case .motorcycle:
        let motorcycle = Motorcycle(model: "Esportiva", maxSpeed: 250.0, fuelType: "Gasolina")
        motorcycle.startEngine()
    case .bicycle:
        let bicycle = Bicycle(model: "Mountain Bike", maxSpeed: 30.0, fuelType: "Nenhuma")
        bicycle.startEngine()
    }
}

for vehicleType in vehicleTypes {
    printVehicleInfo(vehicleType: vehicleType)
}

let dispatchGroup = DispatchGroup()

dispatchGroup.enter()
DispatchQueue.global().async {
    print("Tarefa 1 em execução.")
    dispatchGroup.leave()
}

dispatchGroup.enter()
DispatchQueue.global().async {
    print("Tarefa 2 em execução.")
    dispatchGroup.leave()
}

dispatchGroup.wait()
