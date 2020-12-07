//
//  CarFipeViewCell.swift
//  exerciciofipe
//
//  Created by Luciana on 07/12/20.
//

import UIKit

class CarFipeViewCell: UITableViewCell {
    
    @IBOutlet weak var labelList: UILabel!
    
    
    func setup(name: String) {
        labelList.text = name
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
