//
//  BaseClass.swift
//  exerciciofipe
//
//  Created by Luciana on 07/12/20.
//

import Foundation
import SwiftyJSON


class BaseClass {
    var name: String
    var cod: String
    
    init(json: JSON) {
        self.name = json["nome"].stringValue
        self.cod = json["codigo"].stringValue
    }
}

