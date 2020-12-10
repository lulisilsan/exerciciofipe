//
//  CarDetailViewModel.swift
//  exerciciofipe
//
//  Created by Luciana on 10/12/20.
//

import Foundation
import Alamofire
import SwiftyJSON

class CarDetailViewModel {
    
    var carDetail: CarDetail?
    
    func getDetailCar(codBrand: String, codModel: String, carYear: String, completionHlander: @escaping (_ result: Bool, _ error: Error?)-> Void){
        AF.request("https://parallelum.com.br/fipe/api/v1/carros/marcas/\(codBrand)/modelos/\(codModel)/anos/\(carYear)").responseJSON {(response) in
            if let dictionary = response.value as? [String:Any] {
                self.carDetail = CarDetail(json: JSON(dictionary))
                completionHlander(true, nil)
            }else {
                completionHlander(false, response.error)
            }
        }
    }
    
    func getDetailCar() -> CarDetail? {
        if let car = carDetail {
            return car
        } else {
            return nil
        }
    }
    
}
