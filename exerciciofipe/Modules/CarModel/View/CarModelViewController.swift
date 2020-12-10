//
//  CarModelViewController.swift
//  exerciciofipe
//
//  Created by Luciana on 09/12/20.
//

import UIKit

class CarModelViewController: UIViewController {
    
    @IBOutlet weak var modelTableView: UITableView!
    
    var viewModel: CarModelViewModel?
    var codBrand: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = CarModelViewModel()
        
        prepareTitle()
        prepareTableView()
        loadData()
        

    }
    func prepareTitle() {
        navigationController?.navigationBar.makeClear()
        title = "Fipe - Model"
        
    }
    
    func prepareTableView() {
        modelTableView.register(UINib(nibName: "CarFipeViewCell", bundle: nil), forCellReuseIdentifier: "CarFipeViewCell")
        modelTableView.dataSource = self
        modelTableView.delegate = self
        
    }
    
    func loadData () {
        
        viewModel?.getModels(id: codBrand!, completionHandler: { (sucess, _) in
            if sucess {
                DispatchQueue.main.async {
                    self.modelTableView.reloadData()
                }
            }
        })
        
    }

}

extension CarModelViewController: UITableViewDelegate {
    
}

extension CarModelViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfModels() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarFipeViewCell", for: indexPath) as! CarFipeViewCell
        cell.setup(name: viewModel!.modelList[indexPath.row].name)
        return cell
    }
}
