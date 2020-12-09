//
//  BrandViewController.swift
//  exerciciofipe
//
//  Created by Luciana on 09/12/20.
//

import UIKit

class BrandViewController: UIViewController {
    

    @IBOutlet weak var brandTableView: UITableView!
    
    var viewModel: CarBrandViewModel?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = CarBrandViewModel()
        
        prepareTitle()
        prepareTableView()
        loadData()
        

    }
    func prepareTitle() {
        navigationController?.navigationBar.makeClear()
        title = "Fipe - Brand"
        
    }
    
    func prepareTableView() {
        brandTableView.register(UINib(nibName: "CarFipeViewCell", bundle: nil), forCellReuseIdentifier: "CarFipeViewCell")
        brandTableView.dataSource = self
        brandTableView.delegate = self
        
    }
    
    func loadData () {
        viewModel?.getBrand(completionHandler: { (sucess, _) in
            if sucess {
                DispatchQueue.main.async {
                    self.brandTableView.reloadData()
                }
            }
        })
    }

}

extension BrandViewController: UITableViewDelegate {
    
}

extension BrandViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfBrand() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarFipeViewCell", for: indexPath) as! CarFipeViewCell
        cell.setup(name: viewModel!.brandList[indexPath.row].name)
        return cell
    }
    
    
}
