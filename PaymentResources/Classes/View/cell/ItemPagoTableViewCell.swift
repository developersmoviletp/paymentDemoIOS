//
//  ItemPagoTableViewCell.swift
//  EstrategiaDigital
//
//  Created by Charls Salazar on 04/07/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit

public class ItemPagoTableViewCell: UITableViewCell {

    @IBOutlet weak var serviceAddOnLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
