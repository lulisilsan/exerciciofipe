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
    var yearModel: String
    var fuel: String
    var codFipe: String
    var reference: String
    var typeCar: String
    var initialFuel: String
    
    init(json: JSON) {
        self.price = json["Valor"].stringValue
        self.brand = json["Marca"].stringValue
        self.carModel = json["Modelo"].stringValue
        self.yearModel = json["AnoModelo"].stringValue
        self.fuel = json["Combustivel"].stringValue
        self.codFipe = json["CodigoFIPE"].stringValue
        self.reference = json["MesReferencia"].stringValue
        self.typeCar = json["TipoVeiculo"].stringValue
        self.initialFuel = json["SiglaCombustivel"].stringValue
    }
}
