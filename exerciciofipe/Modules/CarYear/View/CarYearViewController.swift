//
//  CarYearViewController.swift
//  exerciciofipe
//
//  Created by Luciana on 10/12/20.
//

import UIKit

class CarYearViewController: UIViewController {
    
    @IBOutlet weak var carYearTableView: UITableView!
    
    var viewModel: CarYearViewModel?
    var codBrand: String?
    var codModel: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CarYearViewModel()
        
        prepareTitle()
        prepareTableView()
        loadData()
        
    }
    
    func prepareTitle() {
        navigationController?.navigationBar.makeClear()
        title = "Fipe - Year"
        
    }
    
    func prepareTableView() {
        carYearTableView.register(UINib(nibName: "CarFipeViewCell", bundle: nil), forCellReuseIdentifier: "CarFipeViewCell")
        carYearTableView.dataSource = self
        carYearTableView.delegate = self
        
    }
    
    func loadData () {
        
        viewModel?.getYear(codBrand: codBrand!, codModel: codModel!, completionHlander: { (sucess, _) in
            if sucess {
                DispatchQueue.main.async {
                    self.carYearTableView.reloadData()
                }
            }
        })
    }
}
    

extension CarYearViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let carDetail = UIStoryboard(name: "CarDetail", bundle: nil).instantiateInitialViewController() as? CarDetailViewController {
            carDetail.codBrand = self.codBrand
            carDetail.codModel = self.codModel
            carDetail.carYear = String(viewModel!.listYear[indexPath.row].cod)
            navigationController?.pushViewController(carDetail, animated: true)
        }
    }
}

extension CarYearViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfYear() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarFipeViewCell", for: indexPath) as! CarFipeViewCell
        cell.setup(name: viewModel!.listYear[indexPath.row].name)
        return cell
    }
}

    

 
