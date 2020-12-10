//
//  CarDetailViewController.swift
//  exerciciofipe
//
//  Created by Luciana on 10/12/20.
//

import UIKit

class CarDetailViewController: UIViewController {
    
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelBrand: UILabel!
    @IBOutlet weak var labelModel: UILabel!
    @IBOutlet weak var labelYear: UILabel!
    @IBOutlet weak var labelFuel: UILabel!
    
    
    
    var viewModel: CarDetailViewModel?
    var codBrand: String?
    var codModel: String?
    var carYear: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CarDetailViewModel()
        prepareTitle()
        loadData()
        
    }
    
    func prepareTitle() {
        navigationController?.navigationBar.makeClear()
        title = "Detail"
        
    }
    
    func loadData() {
        viewModel?.getDetailCar(codBrand: codBrand!, codModel: codModel!, carYear: carYear!, completionHlander: { (sucess, _) in
            DispatchQueue.main.async {
                self.prepareData()
            }
        })
    }
    
    func prepareData() {
        if let car = viewModel?.getDetailCar() {
            labelPrice.text = car.price
            labelBrand.text = car.brand
            labelModel.text = car.carModel
            labelYear.text = String(car.yearModel)
            labelFuel.text = car.fuel
        }
        
    }
 
}
