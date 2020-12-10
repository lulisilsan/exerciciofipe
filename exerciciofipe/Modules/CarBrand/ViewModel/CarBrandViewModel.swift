//
//  CarBrandViewModel.swift
//  exerciciofipe
//
//  Created by Luciana on 09/12/20.
//

import Foundation
import Alamofire
import SwiftyJSON

class CarBrandViewModel {
    
    var brandList: [Brand] = []
    
    
    func getBrand(completionHandler: @escaping (_ result: Bool, _ error: Error?) -> Void) {
        completionHandler(true, nil)
        
        AF.request("https://parallelum.com.br/fipe/api/v1/carros/marcas").responseJSON { (response) in
            if let dictionary = response.value as? [[String: Any]] {
                for item in dictionary {
                    let brand = Brand(json: JSON(item))
                    self.brandList.append(brand)
                }
                completionHandler(true, nil)
            } else {
                completionHandler(false, response.error)
            }
        }
    
    }
    
    func numberOfBrand() -> Int{
        return brandList.count
    }
    
}
