//
//  CarDetail.swift
//  exerciciofipe
//
//  Created by Luciana on 07/12/20.
//

import Foundation
import SwiftyJSON

class CarDetail {
    var price: String
    var brand: String
    var carModel: String
    var yearModel: Int
    var fuel: String
    
    
    init(json: JSON) {
        self.price = json["Valor"].stringValue
        self.brand = json["Marca"].stringValue
        self.carModel = json["Modelo"].stringValue
        self.yearModel = json["AnoModelo"].intValue
        self.fuel = json["Combustivel"].stringValue
    }
}
