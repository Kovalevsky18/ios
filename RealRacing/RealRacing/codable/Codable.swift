
import Foundation
import UIKit
class BaseElement: Codable {
    var name: String?
    var record:Int? = 0
    var photo :UIImage?
    
    private enum CodingKeys: String, CodingKey { // набор ключей под которыми будут упаковываться проперти
        case name
        case record
        case photo
    }
    
    init() {}

    required init(from decoder: Decoder) throws { //обязательная инициализация //процедура сборки объекта из даты
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)     //  (тип данных объекта, ключ)
        record = try container.decodeIfPresent(Int.self, forKey: .record)
        let data = try container.decode(Data.self, forKey: .photo)
        photo = UIImage(data: data)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.record, forKey: .record)
    }
}
