import UIKit
import Foundation
class StorageManager{
    static let shared = StorageManager()
    init() {}
    var carKey = "car"
    var trashKey = "trashKey"
    var speedKey = "speed"
    let defaults = UserDefaults.standard
    func saveCar(text:String){
        defaults.set(text, forKey: carKey)
        defaults.synchronize()
    }
    func saveRock(text:String){
        defaults.set(text, forKey: trashKey)
        defaults.synchronize()
    }
    
    func loadCar()->String?{
        let text = defaults.string(forKey: carKey)
        return text
    }
    func loadTrash()->String?{
        let text = defaults.string(forKey: trashKey)
        return text
    }
    func saveSpeed(speed:Double){
        defaults.set(speed,forKey:speedKey)
        defaults.synchronize()
    }
    func loadSpeed()->Double?{
        let speed = defaults.double(forKey: speedKey)
        return speed
    }

    
}

