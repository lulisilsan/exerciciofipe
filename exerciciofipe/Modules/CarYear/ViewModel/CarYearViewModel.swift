//
//  CarYearViewModel.swift
//  exerciciofipe
//
//  Created by Luciana on 10/12/20.
//

import Foundation
import Alamofire
import SwiftyJSON

class CarYearViewModel {
    
    var listYear: [CarYear] = []
    
    func getYear(codBrand: String, codModel: String, completionHlander: @escaping (_ result: Bool, _ error: Error?) -> Void) {
        AF.request("https://parallelum.com.br/fipe/api/v1/carros/marcas/\(codBrand)/modelos/\(codModel)/anos").responseJSON { (response) in
            if let yearList = response.value as? [[String: Any]] {
                for item in yearList {
                    let year = CarYear(json: JSON(item))
                    self.listYear.append(year)
                }
                completionHlander(true, nil)
            } else {
                completionHlander(false, response.error)
            }
        }
    }
    
    func numberOfYear() -> Int {
        return listYear.count
    }
    
}
