//
//  InvestmentCell.swift
//  InvesTAPP
//
//  Created by User on 12/2/17.
//  Copyright © 2017 Zerocool. All rights reserved.
//

import UIKit


class InvestmentCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var serialNumberLabel: UILabel!
    
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.adjustsFontForContentSizeCategory = true
        serialNumberLabel.adjustsFontForContentSizeCategory = true
        valueLabel.adjustsFontForContentSizeCategory = true
    }
    
    
    
}
