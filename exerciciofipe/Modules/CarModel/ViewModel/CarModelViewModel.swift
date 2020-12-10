//
//  CarModelViewModel.swift
//  exerciciofipe
//
//  Created by Luciana on 09/12/20.
//

import Foundation
import Alamofire
import SwiftyJSON

class CarModelViewModel {
    
    var modelList: [CarModel] = []
    
    func getModels(id: String, completionHandler: @escaping(_ result: Bool, _ error: Error?) -> Void) {
        
        AF.request("https://parallelum.com.br/fipe/api/v1/carros/marcas/\(id)/modelos").responseJSON { (response) in
            var listModel: [CarModel] = []
            if let dictionary = response.value as? [String: Any], let list = dictionary["modelos"] as? [[String: Any]] {
                for item in list {
                    let model = CarModel(json: JSON(item))
                    listModel.append(model)
                }
                self.modelList = listModel
                completionHandler(true, nil)
            } else {
                completionHandler(false, response.error )
            }
        }
    }
    
    func numberOfModels() -> Int{
        return modelList.count
    }
    
    
    
    
   
    
    
    
    
    
}
